package br.com.analise_sangue_backend.entity;

import br.com.analise_sangue_backend.dto.UsuarioDto;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Entity(name = "usuario")
public class UsuarioEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(unique = true)
    private String nome;

    @Setter
    @NotBlank
    private String senha;

    public UsuarioEntity(UsuarioDto dto) {
        this.nome = dto.getNome();
        this.senha = dto.getSenha();
    }
}