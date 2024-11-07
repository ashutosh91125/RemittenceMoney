package com.llm.repositories;

import com.llm.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerValidationRepository extends JpaRepository<Customer, Long> {
//    Customer findByIdNumberAndIdType(String idNumber, String idType);
}
