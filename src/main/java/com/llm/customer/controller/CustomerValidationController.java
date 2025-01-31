//package com.llm.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.llm.Service.CustomerValidationService;
//import com.llm.customer.model.Customer;
//import com.llm.model.request.CustomerValidationRequest;
//import com.llm.model.response.CustomerValidationResponse;
//
//@RestController
//@RequestMapping("/caas/api/v2/customer")
//public class CustomerValidationController {
//
//    @Autowired
//    private CustomerValidationService customerValidationService;
//
//    @PostMapping("/validate")
//    public ResponseEntity<CustomerValidationResponse> validateCustomer(@RequestBody CustomerValidationRequest request) {
//        Customer customer = customerValidationService.validateCustomer(request.getIdNumber(), request.getIdType());
//
//        if (customer == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//
//        CustomerValidationResponse response = new CustomerValidationResponse();
//        response.setStatus("success");
//        response.setStatusCode(200);
//
//        // Populate the response object based on customer data
//        // ...
//
//        return ResponseEntity.ok(response);
//    }
//}



