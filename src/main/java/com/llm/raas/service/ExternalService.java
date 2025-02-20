package com.llm.raas.service;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Map;

public interface ExternalService {

     Map<String, Object> callExternalApi(Map<String, Object> requestBody, HttpServletRequest httpServletRequest);

     Map<String, Object> createTransaction(Map<String, Object> requestBody, HttpServletRequest request);

     Map<String, Object> confirmTransaction(Map<String, Object> requestBody, HttpServletRequest servletRequest);

     Map<String, Object> enquireTransaction(String transactionRefNumber);

     Map<String, Object> getTransactionReceipt(String transactionRefNumber, HttpServletRequest servletRequest);

     Map<String, Object> cancelTransaction(Map<String, Object> requestBody, HttpServletRequest servletRequest);

     Map<String, Object> getRates();

     Map<String, Object> getBanks(String receivingCountryCode, String receivingMode);

     Map<String, Object> getBankBranches(String bankId, String receivingCountryCode, String correspondent, String receivingMode);
}
