package br.com.analise_sangue_backend.controller;

import br.com.analise_sangue_backend.dto.*;
import br.com.analise_sangue_backend.service.DoadorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/doador")
public class DoadorController {

    private final DoadorService doadorService;

    @GetMapping("/por-estado")
    public List<DoadorEstadoDto> contarDoadoresPorEstado(@RequestParam Long arquivoId) {
        return doadorService.contarDoadoresPorEstado(arquivoId);
    }

    @GetMapping("/imc-faixa-etaria")
    public List<FaixaEtariaImcDto> calcularImcMedioPorFaixaEtaria(@RequestParam Long arquivoId) {
        return doadorService.calcularImcMedioPorFaixaEtaria(arquivoId);
    }

    @GetMapping("/obeso-sexo")
    public List<ObesidadePorSexoDto> calcularPercentualObesosPorSexo(@RequestParam Long arquivoId) {
        return doadorService.calcularPercentualObesosPorSexo(arquivoId);
    }

    @GetMapping("/idade-tipo-sanguineo")
    public List<MediaIdadeTipoSanguineoDto> calcularMediaIdadePorTipoSanguineo(@RequestParam Long arquivoId) {
        return doadorService.calcularMediaIdadePorTipoSanguineo(arquivoId);
    }

    @GetMapping("/doadores-tipo-sanguineo-receptor")
    public List<DoadorTipoSanguineoDto> contarDoadoresPorTipoSanguineoReceptor(@RequestParam Long arquivoId) {
        return doadorService.contarDoadoresPorTipoSanguineoReceptor(arquivoId);
    }
}
