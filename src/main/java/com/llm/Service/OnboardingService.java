package com.llm.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Customer;
import com.llm.repositories.OnboardingRepository;

@Service
public class OnboardingService {

    @Autowired
    private OnboardingRepository onboardingRepository;

    public Customer onboardCustomer(Customer customer) {
        return onboardingRepository.save(customer);
    }
}
