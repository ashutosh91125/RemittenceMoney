package com.llm.transfer.Service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		transfer.setTransactionDate(LocalDate.now());
		return transferRepository.save(transfer);
	}

	@Override
	public List<Transfer> getAllTransfers() {
		return transferRepository.findAll();
	}

}
