package com.llm.transfer.Service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.common.service.EnumEntityService;
import com.llm.customer.model.Customer;
import com.llm.customer.repository.CustomerRepository;
import com.llm.model.response.ResponseDTO;
import com.llm.receipt.dto.ReceiptDTO;
import com.llm.receipt.service.ReceiptService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.llm.beneficiary.model.entity.BeneficiaryDetails;
import com.llm.beneficiary.repository.BeneficiaryDetailsRepository;
import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;
import com.llm.transfer.repository.TransferRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TransferServiceImpl implements TransferService {
	@Autowired
	private TransferRepository transferRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AgentRepositories agentRepositories;

	@Autowired
	private BeneficiaryDetailsRepository beneficiaryRepository;

	@Autowired
	private ReceiptService receiptService;

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private EnumEntityService enumEntityService;

	@Override
	public Transfer createTransfer(Transfer transfer, HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		transfer.setUsername(username);
		transfer.setTransactionDate(LocalDateTime.now());

		transfer.setTransactionState(transfer.getTransactionState().replace("_"," "));
		transfer.setTransactionSubState(transfer.getTransactionSubState().replace("_"," "));
		if(transfer.getPaymentStatus() != null){
			transfer.setPaymentStatus(transfer.getPaymentStatus().toUpperCase());
		}else {
			transfer.setPaymentStatus("FAILED");
		}


		if(beneficiaryRepository.findByBeneficiaryAccountNo(transfer.getBeneficiaryAccountNo()).isEmpty()){
			BeneficiaryDetails beneficiaryDetails = new BeneficiaryDetails();
			beneficiaryDetails.setEcrn(transfer.getEcrn());
			beneficiaryDetails.setBeneficiaryDeliveryOption(transfer.getBeneficiaryDeliveryOption());
			beneficiaryDetails.setPayOutCountry(transfer.getPayOutCountry());
			beneficiaryDetails.setCurrencies(transfer.getCurrencies());
			beneficiaryDetails.setBeneficiaryBank(transfer.getBeneficiaryBank());
			beneficiaryDetails.setBeneficiaryBranch(transfer.getBeneficiaryBranch());
			beneficiaryDetails.setBeneficiaryIban(transfer.getBeneficiaryIban());
			beneficiaryDetails.setBeneficiaryAccountType(transfer.getBeneficiaryAccountType());
			beneficiaryDetails.setBeneficiaryAccountNo(transfer.getBeneficiaryAccountNo());
			beneficiaryDetails.setBeneficiaryAccountName(transfer.getBeneficiaryAccountName());
			beneficiaryDetails.setBeneficiaryType(transfer.getBeneficiaryType());
			beneficiaryDetails.setBeneficiaryRelation(transfer.getBeneficiaryRelation());
			beneficiaryDetails.setBeneficiaryNickname(transfer.getBeneficiaryNickname());
			beneficiaryDetails.setBeneficiaryFirstName(transfer.getBeneficiaryFirstName());
			beneficiaryDetails.setBeneficiaryMiddleName(transfer.getBeneficiaryMiddleName());
			beneficiaryDetails.setBeneficiaryLastName(transfer.getBeneficiaryLastName());
			beneficiaryDetails.setBeneficiaryAddress1(transfer.getBeneficiaryAddress1());
			beneficiaryDetails.setBeneficiaryAddress2(transfer.getBeneficiaryAddress2());
			beneficiaryDetails.setBeneficiaryCity(transfer.getBeneficiaryCity());
			beneficiaryDetails.setBeneficiaryState(transfer.getBeneficiaryState());
			beneficiaryDetails.setBeneficiaryMobile(transfer.getBeneficiaryMobile());
			beneficiaryDetails.setBeneficiaryNationality(transfer.getBeneficiaryNationality());
			beneficiaryDetails.setBeneficiaryDob(transfer.getBeneficiaryDob());
			beneficiaryDetails.setBeneficiaryIdType(transfer.getBeneficiaryIdType());
			beneficiaryDetails.setBeneficiaryIdNo(transfer.getBeneficiaryIdNo());

			beneficiaryRepository.save(beneficiaryDetails);
		}
		Transfer savedTransfer = transferRepository.save(transfer);

		// Assuming you already have the savedTransfer object available from the database.
		ReceiptDTO receiptDTO = new ReceiptDTO();

		Customer customer = customerRepository.findByEcrn(savedTransfer.getEcrn());
		String occupation = enumEntityService.getEnumValueDescriptionByKeyAndValueId("occupationId", String.valueOf(customer.getOccupationId()));
		String customerIdTpe = enumEntityService.getEnumValueDescriptionByKeyAndValueId("idType", savedTransfer.getIdType());
		String nationality = enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", savedTransfer.getBeneficiaryNationality());


// Mapping fields from the savedTransfer to the receiptDTO
		receiptDTO.setTransactionRefNumber(savedTransfer.getTransactionReferenceNumber());
		receiptDTO.setDate(LocalDate.now()); // Set the current date for the receipt (could be different if required).
		receiptDTO.setCustomerNo(savedTransfer.getEcrn()); // Assuming the customer number is the username in Transfer.
		receiptDTO.setPayoutAmount(savedTransfer.getPayoutAmount());
		receiptDTO.setPayOutCurrency(savedTransfer.getCurrencies()); // Assuming the currencies field is the payout currency.
		receiptDTO.setCustomerName(savedTransfer.getFirstName() + " " + savedTransfer.getLastName());
		receiptDTO.setCustomerPhone(savedTransfer.getPrimaryMobileNumber());
		receiptDTO.setCustomerIdType(customerIdTpe);
		receiptDTO.setCustomerIdNo(savedTransfer.getIdNumber());
		receiptDTO.setIdDateOfExpiry(savedTransfer.getDateOfExpiry()); // Mapping the expiration date.
		receiptDTO.setNationality(savedTransfer.getNationality());
		receiptDTO.setIssuedAt(savedTransfer.getIssuedBy()); // Assuming "issuedAt" corresponds to the "issuedBy" field.
		receiptDTO.setSourceOfFund(savedTransfer.getSourceOfFund());
		receiptDTO.setPurposeOfTxn(savedTransfer.getTransactionPurpose());
		receiptDTO.setCustomerCity(savedTransfer.getAddress1());
		receiptDTO.setEmployerName(customer.getEmployerName()); // If available
		receiptDTO.setOccupation(occupation); // If available
		receiptDTO.setPayInAmount(savedTransfer.getPayInAmount());
		receiptDTO.setPayInCurrency(savedTransfer.getPayInCurrency());
		receiptDTO.setCommission(savedTransfer.getCommission());
		receiptDTO.setRate(savedTransfer.getRate());
		receiptDTO.setTax(savedTransfer.getTax());
		//receiptDTO.setOtherCharges(savedTransfer.getOtherCharges()); // If available
		receiptDTO.setTotalPayInAmount(savedTransfer.getTotalPayInAmount());
		receiptDTO.setBeneficiaryName(savedTransfer.getBeneficiaryFirstName() + " " + savedTransfer.getBeneficiaryLastName());
		receiptDTO.setBeneficiaryPhone(savedTransfer.getBeneficiaryMobile());
		receiptDTO.setBeneficiaryRelation(savedTransfer.getBeneficiaryRelation());
		receiptDTO.setBeneficiaryNationality(nationality);
		receiptDTO.setBenBank(savedTransfer.getBeneficiaryBank());
		receiptDTO.setBenBranch(savedTransfer.getBeneficiaryBranch());
		receiptDTO.setIban(savedTransfer.getBeneficiaryIban());
		receiptDTO.setAccountNo(savedTransfer.getBeneficiaryAccountNo());
		receiptDTO.setRemarks(savedTransfer.getRemarks());
		receiptDTO.setBeneficiaryAddress(savedTransfer.getBeneficiaryAddress1() + " " + savedTransfer.getBeneficiaryAddress2());

		// Call the service method to generate the PDF receipt
		receiptService.generateReceiptPdf(receiptDTO, request, response);

		return savedTransfer;
	}

	@Override
	public List<Transfer> getAllTransfers() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String role = authentication.getAuthorities().stream()
				.map(GrantedAuthority::getAuthority)
				.findFirst()
				.orElse(null);


		if ("ROLE_ADMIN".equals(role)) {
			return transferRepository.findAll();
		} else if ("ROLE_SUB_ADMIN".equals(role)) {
			Optional<User> byUsername = userRepository.findByUsername(username);
			return transferRepository.findByStaffCountry(byUsername.get().getCountry());
		} else if ("ROLE_AGENT".equals(role)) {
			Agent byUsername = agentRepositories.findByUsername(username);
			return transferRepository.findByBranchLocationId(byUsername.getBranchLocationId());
		} else {
			return transferRepository.findByUsername(username);
		}
	}

	@Override
	public Transfer getTransactionByTransactionReferenceNumber(String transactionReferenceNumber) {
		Optional<Transfer> transfer = transferRepository.findTransactionByTransactionReferenceNumber(transactionReferenceNumber);
		if(transfer.isEmpty()) {
			 throw new IllegalArgumentException("Transaction Reference Number Not Found");
		}
		return transfer.get();
	}

	/**
	 * Update the transaction state and sub-state based on the transaction reference number.
	 *
	 * @param transactionReferenceNumber Transaction reference number to identify the record.
	 * @param transactionState           New transaction state.
	 * @param transactionSubState        New transaction sub-state.
	 * @return ResponseDTO indicating the success or failure of the operation.
	 */
	@Override
	public ResponseDTO updateTransactionState(String transactionReferenceNumber, String transactionState, String transactionSubState) {
		try {
			// Fetch the transfer record by transactionReferenceNumber
			Transfer transfer = transferRepository.findByTransactionReferenceNumber(transactionReferenceNumber);

			if (transfer == null) {
				return new ResponseDTO(HttpStatus.NOT_FOUND.value(), "failed", "Transaction not found", null);
			}

			transfer.setTransactionState(transactionState);
			transfer.setTransactionSubState(transactionSubState);
			transferRepository.save(transfer);

			return new ResponseDTO(HttpStatus.OK.value(), "success", "Transaction updated successfully", null);
		} catch (Exception ex) {
			return new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR.value(), "failed", "An error occurred while updating the transaction", ex.getMessage());
		}
	}
}
