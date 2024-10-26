package com.llm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.Service.OnboardingService;
import com.llm.model.Customer;
import com.llm.model.OnboardingSuccessResponse;

@RestController
@RequestMapping("/caas-lcm/api/v1/CAAS")
public class OnboardingController {

    @Autowired
    private OnboardingService onboardingService;

    @PostMapping("/onBoarding/customer")
    public ResponseEntity<OnboardingSuccessResponse> onboardCustomer(@RequestBody Customer customerRequest) {
        // Call the onboarding service to save customer details
        Customer customer = onboardingService.onboardCustomer(customerRequest);

        // Create the success response
        OnboardingSuccessResponse response = new OnboardingSuccessResponse();
        response.setStatus("success");
        response.setStatusCode(200);
       // response.setData(customer);
        response.setRequestId("4138e3038999d41b7534ce12a18a6031"); // Typically dynamically generated

        // Return the response entity with a 200 status
        return ResponseEntity.ok(response);
    }
}
