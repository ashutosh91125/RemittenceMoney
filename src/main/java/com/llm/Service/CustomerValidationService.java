package com.llm.Service;

import com.llm.model.Customer;
import com.llm.repositories.CustomerValidationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerValidationService {

    @Autowired
    private CustomerValidationRepository customerValidationRepository;

    public Customer validateCustomer(String idNumber, String idType) {
        return customerValidationRepository.findByIdNumberAndIdType(idNumber, idType);
    }
}
