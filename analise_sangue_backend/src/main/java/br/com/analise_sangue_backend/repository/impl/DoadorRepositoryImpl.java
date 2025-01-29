package br.com.analise_sangue_backend.repository.impl;

import br.com.analise_sangue_backend.dto.DoadorEstadoDto;
import br.com.analise_sangue_backend.entity.QDoadorEntity;
import br.com.analise_sangue_backend.repository.DoadorRepositoryCustom;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;
import java.util.Map;

public class DoadorRepositoryImpl implements DoadorRepositoryCustom {

    @PersistenceContext
    private EntityManager em;

    private final QDoadorEntity doador = QDoadorEntity.doadorEntity;

    @Override
    public List<DoadorEstadoDto> contarDoadoresPorEstado() {
        return new JPAQuery<DoadorEstadoDto>(em)
                .select(Projections.constructor(
                        DoadorEstadoDto.class,
                        doador.estado,
                        doador.count()
                ))
                .from(doador)
                .groupBy(doador.estado)
                .fetch();
    }

    @Override
    public Map<String, Double> calcularImcMedioPorFaixaIdade() {
        //Nao tenho idade, somente data de nascimento
        return null;
//        return queryFactory
//                .select(
//                        doador.idade.between(0, 10).when("0-10")
//                                .when(doador.idade.between(11, 20), "11-20")
//                                .when(doador.idade.between(21, 30), "21-30")
//                                .when(doador.idade.between(31, 40), "31-40")
//                                .when(doador.idade.between(41, 50), "41-50")
//                                .when(doador.idade.between(51, 60), "51-60")
//                                .otherwise("61+").as("faixaIdade"),
//                        doador.peso.divide(doador.altura.multiply(doador.altura)).avg().as("imcMedio")
//                )
//                .from(doador)
//                .groupBy(doador.idade.between(0, 10).when("0-10")
//                        .when(doador.idade.between(11, 20), "11-20")
//                        .when(doador.idade.between(21, 30), "21-30")
//                        .when(doador.idade.between(31, 40), "31-40")
//                        .when(doador.idade.between(41, 50), "41-50")
//                        .when(doador.idade.between(51, 60), "51-60")
//                        .otherwise("61+"))
//                .fetch()
//                .stream()
//                .collect(Collectors.toMap(
//                        tuple -> tuple.get(0, String.class),
//                        tuple -> tuple.get(1, Double.class)
//                ));
    }

    @Override
    public Map<String, Double> calcularPercentualObesosPorSexo() {
        return null;
//        List<Tuple> totalObesos = new JPAQuery<ObesoSexoDto>(em)
//                .select(doador.sexo, doador.count())
//                .from(doador)
//                .where(doador.peso.divide(doador.altura.multiply(doador.altura)).gt(30))
//                .groupBy(doador.sexo)
//                .fetch();
//
//        long totalGeral = totalObesos.stream()
//                .mapToLong(tuple -> tuple.get(doador.count()))
//                .sum();
//
//        return totalObesos.stream()
//                .collect(Collectors.toMap(
//                        tuple -> tuple.get(doador.sexo),
//                        tuple -> (tuple.get(doador.count()).doubleValue() / totalGeral) * 100
//                ));
    }

    @Override
    public Map<String, Double> calcularMediaIdadePorTipoSanguineo() {
        return null;
//        return new JPAQuery<>em()
//                .select(doador.tipoSanguineo, doador.idade.avg())
//                .from(doador)
//                .groupBy(doador.tipoSanguineo)
//                .fetch()
//                .stream()
//                .collect(Collectors.toMap(
//                        tuple -> tuple.get(doador.tipoSanguineo),
//                        tuple -> tuple.get(doador.idade.avg())
//                ));
    }

    @Override
    public Map<String, Long> contarDoadoresPorTipoSanguineoReceptor() {
        return null;
//        return new JPAQuery<>()
//                .select(doador.tipoSanguineo, doador.count())
//                .from(doador)
//                .where(doador.idade.between(16, 69)
//                        .and(doador.peso.gt(50)))
//                .groupBy(doador.tipoSanguineo)
//                .fetch()
//                .stream()
//                .collect(Collectors.toMap(
//                        tuple -> tuple.get(doador.tipoSanguineo),
//                        tuple -> tuple.get(doador.count())
//                ));
    }
}
