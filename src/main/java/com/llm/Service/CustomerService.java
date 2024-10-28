package com.llm.Service;

import com.llm.model.*;
import com.llm.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public Customer createCustomer(Customer customer) {
        // Save the customer first to generate the customer_id
        Customer savedCustomer = customerRepository.save(customer);

        // Set the customer reference in CustomerClassification (if present)
  if (savedCustomer.getCustomerClassification() != null) {
            CustomerClassification classification = savedCustomer.getCustomerClassification();
            classification.setCustomer(savedCustomer);

            // Handle Social Links under CustomerClassification
            if (classification.getSocialLinks() != null) {
                for (SocialLink link : classification.getSocialLinks()) {
                    link.setCustomerClassification(classification);
                }
            }
        }


        // Set customer reference in related Address entities
        if (savedCustomer.getAddressList() != null) {
            for (Address address : savedCustomer.getAddressList()) {
                address.setCustomer(savedCustomer);
            }
        }



        // Set customer reference in related Document entities
 if (savedCustomer.getAdditionalDocs() != null) {
            for (Document doc : savedCustomer.getAdditionalDocs()) {
                doc.setCustomer(savedCustomer);
            }
        }

        // Set customer reference in related IdDetail entities
        if (savedCustomer.getIdDetails() != null) {
            for (IdDetail idDetail : savedCustomer.getIdDetails()) {
                idDetail.setCustomer(savedCustomer);
            }
        }


        // Save again to persist all relationships (optional optimization)
        // Only needed if cascading is not configured correctly in your JPA annotations.
        return customerRepository.save(savedCustomer);
    }

    public Optional<Customer> getByEcrn(String ecrn) {
        return Optional.ofNullable(customerRepository.findByEcrn(ecrn));
    }
}
