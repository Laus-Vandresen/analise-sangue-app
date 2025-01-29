package br.com.analise_sangue_backend.dto;

import br.com.analise_sangue_backend.entity.UsuarioEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class UsuarioDto {
    private String nome;

    @Setter
    private String senha;

    public UsuarioDto(UsuarioEntity entity) {
        this.nome = entity.getNome();
        this.senha = entity.getSenha();
    }
}
