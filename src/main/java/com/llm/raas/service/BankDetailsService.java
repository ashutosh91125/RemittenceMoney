package com.llm.raas.service;

import com.llm.raas.model.Bank;
import com.llm.raas.model.Branch;

import java.util.List;

public interface BankDetailsService {

    List<Bank> getAllBanks();

    List<Branch> getAllBranch();

    Bank getBankById(String bankId);

    Branch getBranchById(String branchId);

    Branch getBranchByRoutingCode(String routingCode);

    List<Branch> getBranchesByBankId(String bankId);

    List<Bank> getBankByCountryCode(String countryCode);

    void fetchAndStoreBanks(String receivingCountryCode, String receivingMode);

    void fetchAndStoreBranches(String receivingCountryCode, String correspondent, String receivingMode);
}
