package br.com.analise_sangue_backend.controller;

import br.com.analise_sangue_backend.dto.ArquivoDto;
import br.com.analise_sangue_backend.service.ArquivoService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/arquivo")
public class ArquivoController {

    private final ArquivoService arquivoService;

    @PostMapping("/importar")
    public void importarArquivo(@RequestBody ArquivoDto arquivo) {
        arquivoService.importarArquivo(arquivo);
    }
}
