package com.llm.common.repository;
import com.llm.common.model.EnumEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EnumEntityRepository extends JpaRepository<EnumEntity, String> {

}
