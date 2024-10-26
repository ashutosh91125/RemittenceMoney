package com.llm.controller;

import com.llm.Service.CustomerService;
import com.llm.model.Customer;
import com.llm.model.CustomerResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

@RestController
@RequestMapping("/caas/api/v2/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/{id}")
    public ResponseEntity<CustomerResponse> getCustomerDetails(@PathVariable Long id) {
        Optional<Customer> customer = customerService.getById(id);

        if (!customer.isPresent()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); 
        }

        CustomerResponse response = new CustomerResponse();
        response.setStatus("success");
        response.setStatusCode(200);

        response.setData(customer.get());  

        return ResponseEntity.ok(response);
    }
}
