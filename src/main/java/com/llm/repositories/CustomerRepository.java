package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.model.Customer;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

	 Customer findByEcrn(String ecrn);
//	List<Customer> findByEcrnLikeIgnoreCase(String ecrn);
//	List<Customer> findByPrimaryMobileNumberLikeIgnoreCase(String primaryMobileNumber);
//	List<Customer> findByFirstNameLikeIgnoreCase(String firstName);
//	List<Customer> findByEmailIdLikeIgnoreCase(String emailId);


     List<Customer> findByEcrnContaining(String ecrn); // Customer Number
     List<Customer> findByEmailIdContaining(String emailId);
     List<Customer> findByPrimaryMobileNumberContaining(String primaryMobileNumber);
     List<Customer> findByIdNumberContaining(String idNumber); // Assuming IdDetail has idNumber field
     List<Customer> findByFirstNameContainingOrLastNameContaining(String firstName, String lastName);
}
