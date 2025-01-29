package br.com.analise_sangue_backend.service.impl;

import br.com.analise_sangue_backend.dto.UsuarioDto;
import br.com.analise_sangue_backend.entity.UsuarioEntity;
import br.com.analise_sangue_backend.repository.UsuarioRepository;
import br.com.analise_sangue_backend.service.UsuarioService;
import br.com.analise_sangue_backend.util.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository repository;
    private final JwtUtil jwtUtil;
    private final HttpServletRequest request;

    @Override
    public void salvar(UsuarioDto usuario) {
        repository.save(new UsuarioEntity(usuario));
    }

    @Override
    public UsuarioEntity buscaUsuarioPorNome(String nome) {
        return repository.findByNome(nome).orElse(null);
    }

    @Override
    public UsuarioEntity buscaUsuarioLogado() {
        String token = (String) request.getAttribute("jwtToken");
        return buscaUsuarioPorNome(jwtUtil.extractUsername(token));
    }
}
