package br.com.analise_sangue_backend.service;

import br.com.analise_sangue_backend.dto.*;
import br.com.analise_sangue_backend.entity.ArquivoEntity;

import java.util.List;
import java.util.Map;

public interface DoadorService {

    void salvaDoadores(ArquivoEntity arquivo, List<DoadorDto> doadoresDto);
    List<DoadorEstadoDto> contarDoadoresPorEstado(Long arquivoId);
    List<FaixaEtariaImcDto> calcularImcMedioPorFaixaEtaria(Long arquivoId);
    List<ObesidadePorSexoDto> calcularPercentualObesosPorSexo(Long arquivoId);
    List<MediaIdadeTipoSanguineoDto> calcularMediaIdadePorTipoSanguineo(Long arquivoId);
    List<DoadorTipoSanguineoDto> contarDoadoresPorTipoSanguineoReceptor(Long arquivoId);

}
