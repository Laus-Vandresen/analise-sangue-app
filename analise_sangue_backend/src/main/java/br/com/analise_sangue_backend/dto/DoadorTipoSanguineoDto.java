package br.com.analise_sangue_backend.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class DoadorTipoSanguineoDto {

    private String tipoReceptor;
    private Long quantidade;
}
