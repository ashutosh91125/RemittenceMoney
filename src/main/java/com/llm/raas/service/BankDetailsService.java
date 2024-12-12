package com.llm.raas.service;

public interface BankDetailsService {

    void fetchAndStoreBanks(String receivingCountryCode,String receivingMode);

    void fetchAndStoreBranches(String fetchBankId,String receivingCountryCode, String correspondent, String receivingMode);
}
