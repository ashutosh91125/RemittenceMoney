package com.llm.customer.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.customer.model.dto.UpdateCustomerStatusDTO;
import com.llm.customer.service.CustomerService;
import com.llm.model.response.ResponseDTO;

@RestController
@RequestMapping("/api/v1/customer")
public class CustomerCallBackController {

    @Autowired
    private CustomerService customerService;

    /**
     * Endpoint to update customer status based on ECRN.
     *
     * @param requestDTO Request body containing ecrn, amlScanStatus, and customerStatus.
     * @return ResponseEntity with the result of the operation.
     */
    @PostMapping("/update-status")
    public ResponseEntity<ResponseDTO> updateCustomerStatus(
            @RequestBody UpdateCustomerStatusDTO requestDTO) {
        ResponseDTO response = customerService.updateCustomerStatus(
                requestDTO.getEcrn(),
                requestDTO.getAmlScanStatus(),
                requestDTO.getCustomerStatus()
        );
        return ResponseEntity.status(response.getStatusCode()).body(response);
    }
}
