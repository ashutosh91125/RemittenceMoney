package com.llm.transfer.Service;

import com.llm.model.response.ResponseDTO;
import com.llm.transfer.model.Transfer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

public interface TransferService {
	Transfer createTransfer(Transfer transfer, HttpServletRequest request, HttpServletResponse response);

	List<Transfer> getAllTransfers();
	
	Transfer getTransactionByTransactionReferenceNumber(String transactionReferenceNumber);


	ResponseDTO updateTransactionState(String transactionReferenceNumber, String transactionState, String transactionSubState);
}
