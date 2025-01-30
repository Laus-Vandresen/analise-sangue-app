package br.com.analise_sangue_backend.repository;

import br.com.analise_sangue_backend.dto.FaixaEtariaImcDto;
import br.com.analise_sangue_backend.entity.DoadorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoadorRepository extends JpaRepository<DoadorEntity, Long>, DoadorRepositoryCustom {

//    @Query(value = """
//        SELECT
//            FLOOR(DATE_PART('year', AGE(CAST(data_nasc AS date))) / 10) * 10 AS faixa_etaria,
//            AVG(peso / (altura * altura)) AS imc_medio
//        FROM
//            doador
//        GROUP BY
//            FLOOR(DATE_PART('year', AGE(CAST(data_nasc AS date))) / 10)
//        """, nativeQuery = true)
//    List<FaixaEtariaImcDto> calcularImcMedioPorFaixaIdade();
}
