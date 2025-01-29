package br.com.analise_sangue_backend.repository;

import br.com.analise_sangue_backend.entity.DoadorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DoadorRepository extends JpaRepository<DoadorEntity, Long>, DoadorRepositoryCustom {
}
