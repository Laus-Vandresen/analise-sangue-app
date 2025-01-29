package br.com.analise_sangue_backend.entity;

import br.com.analise_sangue_backend.dto.DoadorDto;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "doador")
public class DoadorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String cpf;
    private String rg;
    @Column(name = "data_nasc")
    private String dataNascimento;
    private String sexo;
    private String mae;
    private String pai;
    private String email;
    private String cep;
    private String endereco;
    private Integer numero;
    private String bairro;
    private String cidade;
    private String estado;
    private String telefoneFixo;
    private String celular;
    private Double altura;
    private Double peso;
    private String tipoSanguineo;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.LAZY)
    @JoinColumn(name = "arquivo_id")
    private ArquivoEntity arquivo;

    public DoadorEntity(DoadorDto dto, ArquivoEntity arquivo) {
        this.nome = dto.getNome();
        this.cpf = dto.getCpf();
        this.rg = dto.getRg();
        this.dataNascimento = dto.getDataNascimento();
        this.sexo = dto.getSexo();
        this.mae = dto.getMae();
        this.pai = dto.getPai();
        this.email = dto.getEmail();
        this.cep = dto.getCep();
        this.endereco = dto.getEndereco();
        this.numero = dto.getNumero();
        this.bairro = dto.getBairro();
        this.cidade = dto.getCidade();
        this.estado = dto.getEstado();
        this.telefoneFixo = dto.getTelefoneFixo();
        this.celular = dto.getCelular();
        this.altura = dto.getAltura();
        this.peso = dto.getPeso();
        this.tipoSanguineo = dto.getTipoSanguineo();
        this.arquivo = arquivo;
    }
}
