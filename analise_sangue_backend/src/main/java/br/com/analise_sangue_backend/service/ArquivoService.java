package br.com.analise_sangue_backend.service;

import br.com.analise_sangue_backend.dto.ArquivoDto;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface ArquivoService {

    void importarArquivo(ArquivoDto arquivo);

    List<ArquivoDto> buscaArquivosUsuarioLogado();
}
