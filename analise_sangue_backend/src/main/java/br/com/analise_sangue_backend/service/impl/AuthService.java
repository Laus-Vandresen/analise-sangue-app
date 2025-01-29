package br.com.analise_sangue_backend.service.impl;

import br.com.analise_sangue_backend.dto.AuthenticationResponseDto;
import br.com.analise_sangue_backend.dto.CustomUserDetails;
import br.com.analise_sangue_backend.dto.UsuarioDto;
import br.com.analise_sangue_backend.entity.UsuarioEntity;
import br.com.analise_sangue_backend.service.UsuarioService;
import br.com.analise_sangue_backend.util.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

@RequiredArgsConstructor
@Service
public class AuthService implements UserDetailsService {

    @Autowired
    private UsuarioService usuarioService;

    @Lazy
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;

    @Lazy
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    public UserDetails loadUserByUsername(String nome) throws UsernameNotFoundException {
        var usuario = usuarioService.buscaUsuarioPorNome(nome);
        if (Objects.isNull(usuario)) {
            throw new UsernameNotFoundException("Usuário não encontrado!");
        }
        return new CustomUserDetails(usuario);
    }

    public void criaUsuario(UsuarioDto usuario) {
        usuario.setSenha(bcryptEncoder.encode(usuario.getSenha()));
        usuarioService.salvar(usuario);
    }

    public AuthenticationResponseDto gerarToken(UsuarioDto authenticatioRequest) throws Exception {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticatioRequest.getNome(), authenticatioRequest.getSenha()));
        } catch (BadCredentialsException e) {
            throw new Exception("Nome ou senha incorretos", e);
        }
        final UserDetails userDetails = loadUserByUsername(authenticatioRequest.getNome());
        final String jwt = jwtUtil.generateToken(userDetails);
        return new AuthenticationResponseDto(jwt);
    }
}
