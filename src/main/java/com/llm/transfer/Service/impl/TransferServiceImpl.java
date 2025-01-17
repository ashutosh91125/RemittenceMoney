package com.llm.transfer.Service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public Transfer createTransfer(Transfer transfer) {
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

		return transferRepository.save(transfer);
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


}
