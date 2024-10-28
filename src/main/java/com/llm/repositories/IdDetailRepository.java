package com.llm.repositories;

import com.llm.model.IdDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IdDetailRepository extends JpaRepository<IdDetail, Integer> {

    // Query to find IdDetail by idNumber and idType
    Optional<IdDetail> findByIdNumberAndIdType(String idNumber, Integer idType);
}
