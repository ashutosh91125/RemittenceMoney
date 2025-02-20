package com.llm.common.repository;

import com.llm.common.model.EnumValue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnumValueRepository extends JpaRepository<EnumValue, Long> {
    // Remove findByEnumEntityKey method, as it's no longer applicable.
    List<EnumValue> findByDependent(String dependent);
}
