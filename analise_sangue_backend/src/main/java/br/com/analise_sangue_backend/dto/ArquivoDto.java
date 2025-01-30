package br.com.analise_sangue_backend.dto;

import br.com.analise_sangue_backend.entity.ArquivoEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class ArquivoDto {

    private Long id;
    private Long usuarioId;
    private String nomeArquivo;
    private LocalDateTime dataImportacao;
    List<DoadorDto> doadores;

    public ArquivoDto(ArquivoEntity entity) {
        this.id = entity.getId();
        this.usuarioId = entity.getUsuario().getId();
        this.nomeArquivo = entity.getNomeArquivo();
        this.dataImportacao = entity.getDataImportacao();
    }
}
