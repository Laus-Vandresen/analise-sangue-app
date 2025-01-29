package br.com.analise_sangue_backend.service;

import br.com.analise_sangue_backend.dto.UsuarioDto;
import br.com.analise_sangue_backend.entity.UsuarioEntity;

public interface UsuarioService {
    void salvar(UsuarioDto usuario);
    UsuarioEntity buscaUsuarioPorNome(String nome);

    UsuarioEntity buscaUsuarioLogado();
}
