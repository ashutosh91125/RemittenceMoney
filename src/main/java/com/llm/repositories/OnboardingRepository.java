package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.model.Customer;

@Repository
public interface OnboardingRepository extends JpaRepository<Customer, Long> {
    //  queries for onboarding, if needed
}
