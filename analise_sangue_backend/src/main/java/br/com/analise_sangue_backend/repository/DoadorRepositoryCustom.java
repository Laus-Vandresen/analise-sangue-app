package br.com.analise_sangue_backend.repository;

import br.com.analise_sangue_backend.dto.*;

import java.util.List;
import java.util.Map;

public interface DoadorRepositoryCustom {
    List<DoadorEstadoDto> contarDoadoresPorEstado(Long usuarioId, Long arquivoId);
    List<FaixaEtariaImcDto> calcularImcMedioPorFaixaIdade(Long usuarioId, Long arquivoId);
    List<ObesidadePorSexoDto> calcularPercentualObesosPorSexo(Long usuarioId, Long arquivoId);

    List<MediaIdadeTipoSanguineoDto> calcularMediaIdadePorTipoSanguineo(Long usuarioId, Long arquivoId);

    List<DoadorTipoSanguineoDto> contarDoadoresPorTipoSanguineoReceptor(Long usuarioId, Long arquivoId);
}
