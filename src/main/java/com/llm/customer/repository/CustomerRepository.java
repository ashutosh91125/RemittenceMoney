package com.llm.customer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.llm.customer.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

	 Customer findByEcrn(String ecrn);
     List<Customer> findByEcrnContaining(String ecrn); // Customer Number
     List<Customer> findByEmailIdContaining(String emailId);
     List<Customer> findByPrimaryMobileNumberContaining(String primaryMobileNumber);
     @Query("SELECT c FROM Customer c JOIN c.idDetails idDetail WHERE idDetail.idNumber LIKE %:idNumber%")
     List<Customer> findByIdNumberContaining(@Param("idNumber")String idNumber); // Assuming IdDetail has idNumber field
     List<Customer> findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(String firstName, String lastName);
     boolean existsByPrimaryMobileNumber(String primaryMobileNumber);


}
