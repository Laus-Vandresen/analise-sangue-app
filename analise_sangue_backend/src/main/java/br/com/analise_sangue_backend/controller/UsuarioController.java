package br.com.analise_sangue_backend.controller;

import br.com.analise_sangue_backend.dto.AuthenticationResponseDto;
import br.com.analise_sangue_backend.dto.UsuarioDto;
import br.com.analise_sangue_backend.service.UsuarioService;
import br.com.analise_sangue_backend.service.impl.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RequiredArgsConstructor
@RestController
@RequestMapping("/usuario")
public class UsuarioController {

    private final AuthService authService;

    @PostMapping("/cadastro")
    public ResponseEntity<String> cadastrar(@RequestBody UsuarioDto usuario) {
        authService.criaUsuario(usuario);
        return ResponseEntity.ok("Usuario cadastrado com sucesso!");
    }

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponseDto> login(@RequestBody UsuarioDto usuario) throws Exception {
        return ResponseEntity.ok(authService.gerarToken(usuario));

    }
}
