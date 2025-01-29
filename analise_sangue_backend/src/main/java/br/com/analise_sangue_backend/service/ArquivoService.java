package br.com.analise_sangue_backend.service;

import br.com.analise_sangue_backend.dto.ArquivoDto;
import org.springframework.web.bind.annotation.RequestBody;

public interface ArquivoService {

    void importarArquivo(@RequestBody ArquivoDto arquivo);
}
