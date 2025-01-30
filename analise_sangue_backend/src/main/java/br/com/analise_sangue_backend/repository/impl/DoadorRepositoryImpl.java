package br.com.analise_sangue_backend.repository.impl;

import br.com.analise_sangue_backend.dto.*;
import br.com.analise_sangue_backend.entity.QArquivoEntity;
import br.com.analise_sangue_backend.entity.QDoadorEntity;
import br.com.analise_sangue_backend.entity.QUsuarioEntity;
import br.com.analise_sangue_backend.repository.DoadorRepositoryCustom;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.CaseBuilder;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

import java.util.List;
import java.util.stream.Collectors;

public class DoadorRepositoryImpl implements DoadorRepositoryCustom {

    @PersistenceContext
    private EntityManager em;

    private final QDoadorEntity doador = QDoadorEntity.doadorEntity;
    private final QArquivoEntity arquivo = QArquivoEntity.arquivoEntity;
    private final QUsuarioEntity usuario = QUsuarioEntity.usuarioEntity;

    @Override
    public List<DoadorEstadoDto> contarDoadoresPorEstado(Long usuarioId, Long arquivoId) {
        return new JPAQuery<DoadorEstadoDto>(em)
                .select(Projections.constructor(
                        DoadorEstadoDto.class,
                        doador.estado,
                        doador.count()
                ))
                .from(doador)
                .join(doador.arquivo, arquivo)
                .join(arquivo.usuario, usuario)
                .where(usuario.id.eq(usuarioId).and(arquivo.id.eq(arquivoId)))
                .groupBy(doador.estado)
                .orderBy(doador.estado.asc())
                .fetch();
    }

    @Override
    public List<FaixaEtariaImcDto> calcularImcMedioPorFaixaIdade(Long usuarioId, Long arquivoId) {
        String sql = """
            SELECT
                FLOOR(DATE_PART('year', AGE(CAST(data_nasc AS date))) / 10) * 10 AS faixa_etaria,
                ROUND(CAST(AVG(peso / (altura * altura)) AS numeric), 2) AS imc_medio
            FROM
                doador
            JOIN arquivo ON arquivo.id = doador.arquivo_id
            JOIN usuario ON usuario.id = arquivo.usuario_id
            WHERE arquivo.id = :arquivoId
                AND usuario.id = :usuarioId
            GROUP BY
                FLOOR(DATE_PART('year', AGE(CAST(data_nasc AS date))) / 10)
            ORDER BY faixa_etaria ASC
            """;

        Query query = em.createNativeQuery(sql);
        query.setParameter("arquivoId", arquivoId);
        query.setParameter("usuarioId", usuarioId);

        List<Object[]> resultados = query.getResultList();

        return resultados.stream()
                .map(result -> new FaixaEtariaImcDto(
                        ((Number) result[0]).intValue(),
                        ((Number) result[1]).doubleValue()
                ))
                .collect(Collectors.toList());
    }

    @Override
    public List<ObesidadePorSexoDto> calcularPercentualObesosPorSexo(Long usuarioId, Long arquivoId) {
        JPAQuery<ObesidadePorSexoDto> query = new JPAQuery<>(em);

        NumberExpression<Double> imc = doador.peso.divide(doador.altura.multiply(doador.altura));

        NumberExpression<Integer> casoObeso = new CaseBuilder()
                .when(imc.gt(30.0)).then(1)
                .otherwise(0);

        NumberExpression<Double> percentualObesos = Expressions.numberTemplate(
                Double.class,
                "ROUND({0} * 100.0 / {1}, 2)",
                casoObeso.sum(),
                doador.count()
        );

        query.select(Projections.constructor(
                        ObesidadePorSexoDto.class,
                        doador.sexo,
                        percentualObesos.as("percentualObesos")
                ))
                .from(doador)
                .join(doador.arquivo, arquivo)
                .join(arquivo.usuario, usuario)
                .where(arquivo.id.eq(arquivoId)
                        .and(usuario.id.eq(usuarioId)))
                .orderBy(doador.sexo.asc())
                .groupBy(doador.sexo);

        return query.fetch();
    }

    @Override
    public List<MediaIdadeTipoSanguineoDto> calcularMediaIdadePorTipoSanguineo(Long usuarioId, Long arquivoId) {
        String sql = """
                SELECT d.tipo_sanguineo,
                       ROUND(AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, d.data_nasc))), 2) AS media_idade
                FROM doador d
                INNER JOIN arquivo a ON d.arquivo_id = a.id
                INNER JOIN usuario u ON a.usuario_id = u.id
                WHERE a.id = :arquivoId AND u.id = :usuarioId
                GROUP BY d.tipo_sanguineo
                ORDER BY d.tipo_sanguineo ASC
            """;

        Query query = em.createNativeQuery(sql);
        query.setParameter("arquivoId", arquivoId);
        query.setParameter("usuarioId", usuarioId);

        List<Object[]> resultados = query.getResultList();

        return resultados.stream()
                .map(result -> new MediaIdadeTipoSanguineoDto(
                        ((String) result[0]),
                        ((Number) result[1]).doubleValue()
                ))
                .collect(Collectors.toList());
    }

    @Override
    public List<DoadorTipoSanguineoDto> contarDoadoresPorTipoSanguineoReceptor(Long usuarioId, Long arquivoId) {
        String sql = """
                SELECT
                            r.tipo_receptor AS tipoReceptor,
                            COUNT(d.id) AS quantidade
                        FROM
                            doador d
                        CROSS JOIN LATERAL (
                            SELECT unnest(string_to_array(
                                CASE d.tipo_sanguineo
                                    WHEN 'A+' THEN 'A+,A-,O+,O-'
                                    WHEN 'A-' THEN 'A-,O-'
                                    WHEN 'B+' THEN 'B+,B-,O+,O-'
                                    WHEN 'B-' THEN 'B-,O-'
                                    WHEN 'AB+' THEN 'A+,B+,O+,AB+,A-,B-,O-,AB-'
                                    WHEN 'AB-' THEN 'A-,B-,O-,AB-'
                                    WHEN 'O+' THEN 'O+,O-'
                                    WHEN 'O-' THEN 'O-'
                                END, ','
                            )) AS tipo_receptor
                        ) r
                        INNER JOIN arquivo a ON d.arquivo_id = a.id
                        INNER JOIN usuario u ON a.usuario_id = u.id
                        WHERE
                            a.id = :arquivoId AND u.id = :usuarioId
                            AND AGE(current_date, d.data_nasc) BETWEEN INTERVAL '16 years' AND INTERVAL '69 years'
                            AND d.peso > 50
                        GROUP BY
                            r.tipo_receptor
                        ORDER BY d.tipo_sanguineo ASC
            """;

        Query query = em.createNativeQuery(sql);
        query.setParameter("arquivoId", arquivoId);
        query.setParameter("usuarioId", usuarioId);

        List<Object[]> resultados = query.getResultList();

        return resultados.stream()
                .map(result -> new DoadorTipoSanguineoDto(
                        ((String) result[0]),
                        ((Number) result[1]).longValue()
                ))
                .collect(Collectors.toList());
    }
}
