package com.llm.Service;

import com.llm.model.Customer;
import com.llm.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public Optional<Customer> getById(Long id) {
        return customerRepository.findById(id);
    }
}
