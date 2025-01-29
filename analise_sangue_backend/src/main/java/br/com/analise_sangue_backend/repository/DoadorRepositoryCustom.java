package br.com.analise_sangue_backend.repository;

import br.com.analise_sangue_backend.dto.DoadorEstadoDto;

import java.util.List;
import java.util.Map;

public interface DoadorRepositoryCustom {
    List<DoadorEstadoDto> contarDoadoresPorEstado();
    Map<String, Double> calcularImcMedioPorFaixaIdade();
    Map<String, Double> calcularPercentualObesosPorSexo();
    Map<String, Double> calcularMediaIdadePorTipoSanguineo();
    Map<String, Long> contarDoadoresPorTipoSanguineoReceptor();
}
