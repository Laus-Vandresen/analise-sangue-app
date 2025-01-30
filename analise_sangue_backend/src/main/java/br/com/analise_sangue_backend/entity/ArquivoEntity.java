package br.com.analise_sangue_backend.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "arquivo")
public class ArquivoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private UsuarioEntity usuario;

    private String nomeArquivo;

    @Column
    private LocalDateTime dataImportacao;

    public ArquivoEntity(UsuarioEntity usuario, String nomeArquivo) {
        this.usuario = usuario;
        this.nomeArquivo = nomeArquivo;
        this.dataImportacao = LocalDateTime.now();
    }
}
