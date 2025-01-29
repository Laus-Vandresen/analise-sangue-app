package br.com.analise_sangue_backend.service;

import br.com.analise_sangue_backend.dto.DoadorDto;
import br.com.analise_sangue_backend.entity.ArquivoEntity;

import java.util.List;
import java.util.Map;

public interface DoadorService {

    void salvaDoadores(ArquivoEntity arquivo, List<DoadorDto> doadoresDto);
    Map<String, Long> contarDoadoresPorEstado();
    Map<String, Double> calcularImcMedioPorFaixaIdade();
    Map<String, Double> calcularPercentualObesosPorSexo();
    Map<String, Double> calcularMediaIdadePorTipoSanguineo();
    Map<String, Long> contarDoadoresPorTipoSanguineoReceptor();

}
