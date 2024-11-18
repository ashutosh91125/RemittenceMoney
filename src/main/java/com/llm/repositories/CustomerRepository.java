package com.llm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

	 Customer findByEcrn(String ecrn);
//     List<Customer> findByEcrnContaining(String ecrn); // Customer Number
//     List<Customer> findByEmailIdContaining(String emailId);
//     List<Customer> findByPrimaryMobileNumberContaining(String primaryMobileNumber);
//     List<Customer> findByIdDetails_IdNumberContaining(String idNumber); // Assuming IdDetail has idNumber field
//     List<Customer> findByFirstNameContainingOrLastNameContaining(String firstName, String lastName);
}
