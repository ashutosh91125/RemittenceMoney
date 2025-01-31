package com.llm.repositories;

import com.llm.customer.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface OnboardingRepository extends JpaRepository<Customer, Long> {
    //  queries for onboarding, if needed
}
