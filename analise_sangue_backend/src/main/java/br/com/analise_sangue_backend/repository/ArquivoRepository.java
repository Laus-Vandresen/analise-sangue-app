package br.com.analise_sangue_backend.repository;

import br.com.analise_sangue_backend.entity.ArquivoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArquivoRepository extends JpaRepository<ArquivoEntity, Long> {

    List<ArquivoEntity> findByUsuarioIdOrderByIdDesc(Long usuarioId);
}
