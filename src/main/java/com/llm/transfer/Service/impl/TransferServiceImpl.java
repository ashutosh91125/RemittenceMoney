package com.llm.transfer.Service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;
import com.llm.transfer.repository.TransferRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TransferServiceImpl implements TransferService {
	@Autowired
	private TransferRepository transferRepository;

	@Override
	public Transfer createTransfer(Transfer transfer) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		transfer.setUsername(username);
		transfer.setTransactionDate(LocalDate.now());
		return transferRepository.save(transfer);
	}

	@Override
	public List<Transfer> getAllTransfers() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		return transferRepository.findByUsername(username);
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
