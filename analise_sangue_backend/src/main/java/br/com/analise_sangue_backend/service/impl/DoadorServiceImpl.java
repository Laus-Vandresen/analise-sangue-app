package br.com.analise_sangue_backend.service.impl;

import br.com.analise_sangue_backend.dto.DoadorDto;
import br.com.analise_sangue_backend.entity.ArquivoEntity;
import br.com.analise_sangue_backend.entity.DoadorEntity;
import br.com.analise_sangue_backend.repository.DoadorRepository;
import br.com.analise_sangue_backend.service.DoadorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class DoadorServiceImpl implements DoadorService {

    private final DoadorRepository repository;

    @Override
    public void salvaDoadores(ArquivoEntity arquivo, List<DoadorDto> doadoresDto) {
        List<DoadorEntity> doadoresEntity = doadoresDto.stream().map(doador -> new DoadorEntity(doador, arquivo)).toList();
        repository.saveAll(doadoresEntity);
    }

    @Override
    public Map<String, Long> contarDoadoresPorEstado() {
        return Map.of();
    }

    @Override
    public Map<String, Double> calcularImcMedioPorFaixaIdade() {
        return Map.of();
    }

    @Override
    public Map<String, Double> calcularPercentualObesosPorSexo() {
        return Map.of();
    }

    @Override
    public Map<String, Double> calcularMediaIdadePorTipoSanguineo() {
        return Map.of();
    }

    @Override
    public Map<String, Long> contarDoadoresPorTipoSanguineoReceptor() {
        return Map.of();
    }
}
