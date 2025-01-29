package br.com.analise_sangue_backend.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class DoadorEstadoDto {
    private String estado;
    private Integer quantidade;
}
