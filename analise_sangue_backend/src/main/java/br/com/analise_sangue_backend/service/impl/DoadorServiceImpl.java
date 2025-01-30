package br.com.analise_sangue_backend.service.impl;

import br.com.analise_sangue_backend.dto.*;
import br.com.analise_sangue_backend.entity.ArquivoEntity;
import br.com.analise_sangue_backend.entity.DoadorEntity;
import br.com.analise_sangue_backend.entity.UsuarioEntity;
import br.com.analise_sangue_backend.repository.DoadorRepository;
import br.com.analise_sangue_backend.service.DoadorService;
import br.com.analise_sangue_backend.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class DoadorServiceImpl implements DoadorService {

    private final DoadorRepository repository;
    private final UsuarioService usuarioService;

    @Override
    public void salvaDoadores(ArquivoEntity arquivo, List<DoadorDto> doadoresDto) {
        List<DoadorEntity> doadoresEntity = doadoresDto.stream().map(doador -> new DoadorEntity(doador, arquivo)).toList();
        repository.saveAll(doadoresEntity);
    }

    @Override
    public List<DoadorEstadoDto> contarDoadoresPorEstado(Long arquivoId) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        return repository.contarDoadoresPorEstado(usuarioEntity.getId(), arquivoId);
    }

    @Override
    public List<FaixaEtariaImcDto> calcularImcMedioPorFaixaEtaria(Long arquivoId) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        return repository.calcularImcMedioPorFaixaIdade(usuarioEntity.getId(), arquivoId);
    }

    @Override
    public List<ObesidadePorSexoDto> calcularPercentualObesosPorSexo(Long arquivoId) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        return repository.calcularPercentualObesosPorSexo(usuarioEntity.getId(), arquivoId);
    }

    @Override
    public List<MediaIdadeTipoSanguineoDto> calcularMediaIdadePorTipoSanguineo(Long arquivoId) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        return repository.calcularMediaIdadePorTipoSanguineo(usuarioEntity.getId(), arquivoId);
    }

    @Override
    public List<DoadorTipoSanguineoDto> contarDoadoresPorTipoSanguineoReceptor(Long arquivoId) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        return repository.contarDoadoresPorTipoSanguineoReceptor(usuarioEntity.getId(), arquivoId);
    }
}
