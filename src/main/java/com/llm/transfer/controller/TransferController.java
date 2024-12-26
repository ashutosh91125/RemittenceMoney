package com.llm.transfer.controller;

import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.Service.CustomerService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.Customer;
import com.llm.raas.model.Bank;
import com.llm.raas.service.BankDetailsService;
import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;

@Controller
public class TransferController {
	private static final Logger logger = LoggerFactory.getLogger(TransferController.class);

	@Autowired
	private CustomerService customerService;
	@Autowired
	private EnumEntityService enumEntityService;
	@Autowired
	private TransferService transferService;
	@Autowired
	private BankDetailsService bankService;


	@GetMapping("/transfer")
	public String showTransfer(Model model) {
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of());
		}
		return "transfer";
	}

	@GetMapping("/customer-list-transfer")
	public String getCustomerList(Model model) {
		try {
			List<Customer> customerList = customerService.getAllCustomer();
			Collections.reverse(customerList);
			model.addAttribute("customerList1", customerList);
			return "customerlistingontranfer";
		} catch (Exception e) {
			logger.error("Error occurred while fetching customer list: " + e);
			return "customerlistingontranfer";
		}
	}

	@GetMapping("/searchCustomersOnTransfer")
	public String searchCustomers(@RequestParam("criteria") String criteria, @RequestParam("query") String query,
			Model model) {
		try {
			List<Customer> customers = customerService.searchByCriteria(criteria, query);
			model.addAttribute("customerListOnTransfer", customers);
		} catch (Exception e) {
			logger.error(e.toString());
		}

		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of());
		}
		model.addAttribute("customer", new Customer());
		return "transfer";
	}

	@GetMapping("/transfer-list")
	public String getTransferList(Model model) {
		try {
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			// Fetching the list of transfers
			List<Transfer> transferList = transferService.getAllTransfers();
			for (Transfer transfer : transferList) {
		        Bank bank = bankService.getBankById(transfer.getBeneficiaryBank());
		        transfer.setBeneficiaryBank(bank.getBankName());  // Set the bank name in the transfer object
		        String formattedDate = transfer.getTransactionDate().format(dateFormatter);
	            transfer.setTransactionDateFormatted(formattedDate);
		    }

			// Sorting the transferList by date in descending order
			transferList.sort((t1, t2) -> t2.getTransactionDate().compareTo(t1.getTransactionDate())); // Date is sorted in descending order

			// Adding the sorted list to the model
			model.addAttribute("transferList", transferList);

			return "transferlisting";  // Return the name of the view (JSP page)
		} catch (Exception e) {
			// Log the error if any exception occurs
			logger.error("Error occurred while fetching customer list: " + e);
			return "transferlisting";  // Return to the same view in case of error
		}
	}


	@GetMapping("/transfer-details")
	public String detailsOfTransfer(@RequestParam("transactionReferenceNumber") String transactionReferenceNumber,Model model) {
	Transfer transferDetails = transferService.getTransactionByTransactionReferenceNumber(transactionReferenceNumber);
	
	Optional<Customer> customer = customerService.getByEcrn(transferDetails.getEcrn());
	model.addAttribute("country", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getCountry()));
	model.addAttribute("countryOfResidence", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getCountryOfResidence()));
	model.addAttribute("countryOfNatinality", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getNationality()));
	model.addAttribute("issuedCountry", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getIssuedCountry()));
	model.addAttribute("idType",enumEntityService.getEnumValueDescriptionByKeyAndValueId("idTypes", String.valueOf(customer.get().getIdType())));
	model.addAttribute("payOutCountry", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",transferDetails.getPayOutCountry()));
	model.addAttribute("currency", enumEntityService.getEnumValueDescriptionByKeyAndValueId("currency",transferDetails.getCurrencies()));
	model.addAttribute("bank",bankService.getBankById(transferDetails.getBeneficiaryBank()));
	model.addAttribute("baranch",bankService.getBranchByRoutingCode(transferDetails.getBeneficiaryBranch()));	
	model.addAttribute("benificeryNatinality", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",transferDetails.getBeneficiaryNationality()));
	model.addAttribute("payInCurrency", enumEntityService.getEnumValueDescriptionByKeyAndValueId("currency",transferDetails.getPayInCurrency()));
	model.addAttribute("residentType", customer.get().getResidentTypeId());	
	model.addAttribute("transferDetails", transferDetails);
	return "transferdetails";
	}

}
