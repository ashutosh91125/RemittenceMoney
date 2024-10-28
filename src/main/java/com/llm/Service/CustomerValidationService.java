package com.llm.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Customer;
import com.llm.model.CustomerValidationResponse;
import com.llm.model.IdDetail;
import com.llm.repositories.IdDetailRepository;

@Service
public class CustomerValidationService {

    @Autowired
    private IdDetailRepository idDetailRepository;

    public CustomerValidationResponse.CustomerData validateCustomer(String idNumber, Integer idType) {
        // Fetch IdDetail by idNumber and idType
        Optional<IdDetail> idDetailOptional = idDetailRepository.findByIdNumberAndIdType(idNumber, idType);

        if (idDetailOptional.isEmpty()) {
            return null; // If no IdDetail found, return null
        }

        // Get the associated Customer
        Customer customer = idDetailOptional.get().getCustomer();

        // Map Customer and IdDetail data to response
        CustomerValidationResponse.CustomerData responseData = new CustomerValidationResponse.CustomerData();
        responseData.setEcrn(customer.getEcrn());
        responseData.setFirstName(customer.getFirstName());
        responseData.setMiddleName(customer.getMiddleName());
        responseData.setLastName(customer.getLastName());
        //responseData.setAgentLocationId(customer.getAgentLocationId());
        responseData.setPrimaryMobileNumber(customer.getPrimaryMobileNumber());
        responseData.setEmailId(customer.getEmailId());
        /*responseData.setCustomerStatus(customer.getCustomerStatus());
        responseData.setAmlScanStatus(customer.getAmlScanStatus());*/
        responseData.setIdStatus(customer.getIdDetails().stream()
                .filter(idDetail -> idDetail.getIdNumber().equals(idNumber) && idDetail.getIdType().equals(idType))
                .map(IdDetail::getActiveStatus)
                .findFirst()
                .orElse(null) ? "Active" : "Inactive");
        //responseData.setIdDateOfExpiry(idDetailOptional.get().getDateOfExpiry());

        return responseData;
    }
}


