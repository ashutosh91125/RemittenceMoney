package com.llm.iddetail.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.iddetail.model.IdDetail;

@Repository
public interface IdDetailRepository extends JpaRepository<IdDetail, Long> {

	// Query to find IdDetail by idNumber and idType
	Optional<IdDetail> findByIdNumberAndIdType(String idNumber, Integer idType);

	IdDetail findByIdNumber(String idNumber);

}