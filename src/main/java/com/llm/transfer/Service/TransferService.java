package com.llm.transfer.Service;

import com.llm.model.response.ResponseDTO;
import com.llm.transfer.model.Transfer;

import java.util.List;

public interface TransferService {
	Transfer createTransfer(Transfer transfer);

	List<Transfer> getAllTransfers();
	
	Transfer getTransactionByTransactionReferenceNumber(String transactionReferenceNumber);


	ResponseDTO updateTransactionState(String transactionReferenceNumber, String transactionState, String transactionSubState);
}
