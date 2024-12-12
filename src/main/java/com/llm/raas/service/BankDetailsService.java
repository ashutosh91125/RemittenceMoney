package com.llm.raas.service;

import com.llm.raas.model.Bank;
import com.llm.raas.model.Branch;

import java.util.List;

public interface BankDetailsService {

    List<Bank> getAllBanks();

    List<Branch> getAllBranch();

    Bank getBankById(String bankId);

    Branch getBranchById(String branchId);

    List<Branch> getBranchesByBankId(String bankId);

    void fetchAndStoreBanks(String receivingCountryCode,String receivingMode);

    void fetchAndStoreBranches(String fetchBankId,String receivingCountryCode, String correspondent, String receivingMode);
}
