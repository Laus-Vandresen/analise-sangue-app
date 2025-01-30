package br.com.analise_sangue_backend.service.impl;

import br.com.analise_sangue_backend.dto.ArquivoDto;
import br.com.analise_sangue_backend.entity.ArquivoEntity;
import br.com.analise_sangue_backend.entity.UsuarioEntity;
import br.com.analise_sangue_backend.repository.ArquivoRepository;
import br.com.analise_sangue_backend.service.ArquivoService;
import br.com.analise_sangue_backend.service.DoadorService;
import br.com.analise_sangue_backend.service.UsuarioService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ArquivoServiceImpl implements ArquivoService {

    private final ArquivoRepository repository;
    private final UsuarioService usuarioService;
    private final DoadorService doadorService;

    @Override
    @Transactional
    public void importarArquivo(ArquivoDto arquivo) {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        ArquivoEntity arquivoEntity = repository.save(new ArquivoEntity(usuarioEntity, arquivo.getNomeArquivo()));
        doadorService.salvaDoadores(arquivoEntity, arquivo.getDoadores());
    }

    @Override
    public List<ArquivoDto> buscaArquivosUsuarioLogado() {
        UsuarioEntity usuarioEntity = usuarioService.buscaUsuarioLogado();
        List<ArquivoEntity> arquivoEntityList = repository.findByUsuarioIdOrderByIdDesc(usuarioEntity.getId());
        return arquivoEntityList.stream().map(ArquivoDto::new).toList();
    }
}
