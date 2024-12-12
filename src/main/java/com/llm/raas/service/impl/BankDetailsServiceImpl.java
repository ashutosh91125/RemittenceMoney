package com.llm.raas.service.impl;

import com.llm.raas.model.Bank;
import com.llm.raas.model.Branch;
import com.llm.raas.repository.BankRepository;
import com.llm.raas.repository.BranchRepository;
import com.llm.raas.service.BankDetailsService;
import com.llm.raas.service.ExternalService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BankDetailsServiceImpl implements BankDetailsService {
    @Autowired
    private BankRepository bankRepository;

    @Autowired
    private BranchRepository branchRepository;

    @Autowired
    private ExternalService externalService;

    @Override
    public void fetchAndStoreBanks(String receivingCountryCode,String receivingMode) {
        // Parameters for the API
//        receivingCountryCode = "IN";
//        receivingMode = "BANK";

        // Call getBanks() to fetch data
        Map<String, Object> response = externalService.getBanks(receivingCountryCode, receivingMode);

        // Validate response and extract data
        if (response != null && response.containsKey("data")) {
            Map<String, Object> data = (Map<String, Object>) response.get("data");
            List<Map<String, String>> bankList = (List<Map<String, String>>) data.get("list");

            if (bankList != null) {
                for (Map<String, String> bank : bankList) {
                    String bankId = bank.get("bank_id");
                    String bankName = bank.get("bank_name");

                    // Check if the bank already exists and save if it doesn't
                    if (!bankRepository.existsById(bankId)) {
                        Bank newBank = new Bank();
                        newBank.setBankId(bankId);
                        newBank.setBankName(bankName);
                        bankRepository.save(newBank);
                    }
                }
            }
        } else {
            System.out.println("No valid data received from the API.");
        }
    }

    @Override
    public void fetchAndStoreBranches(String fetchBankId,String receivingCountryCode, String correspondent, String receivingMode) {
        // Call getBranches() to fetch data from the external service
        Map<String, Object> response = externalService.getBankBranches(fetchBankId,receivingCountryCode, correspondent,receivingMode);

        // Validate response and extract data
        if (response != null && response.containsKey("data")) {
            Map<String, Object> data = (Map<String, Object>) response.get("data");
            List<Map<String, String>> branchList = (List<Map<String, String>>) data.get("list");

            if (branchList != null) {
                for (Map<String, String> branch : branchList) {
                    String bankId = branch.get("bank_id");
                    String branchId = branch.get("branch_id");
                    String branchName = branch.get("branch_name");

                    // Check if the branch already exists, and save it if it doesn't
                    if (!branchRepository.existsByBankIdAndBranchId(bankId, branchId)) {
                        Branch newBranch = new Branch();
                        newBranch.setBankId(bankId);
                        newBranch.setBranchId(branchId);
                        newBranch.setBranchName(branchName);
                        newBranch.setRoutingCode(branch.get("routing_code"));
                        newBranch.setIsoCode(branch.get("iso_code"));
                        newBranch.setSort(branch.get("sort"));

                        branchRepository.save(newBranch);
                    }
                }
            } else {
                System.out.println("Branch list is empty in the response.");
            }
        } else {
            System.out.println("No valid data received from the API.");
        }
    }


    @Scheduled(cron = "0 0 0 * * SUN") // Runs every Sunday at midnight
    public void scheduledTask() {
        fetchAndStoreBanks("IN","BANK");
    }

    @Scheduled(cron = "0 0 0 * * SUN") // Runs every Sunday at midnight
    public void updateBranches() {
        String fetchBankId = "11478";
        String receivingCountryCode = "IN";
        String correspondent = "LR";
        String receivingMode = "BANK";
        fetchAndStoreBranches(fetchBankId,receivingCountryCode, correspondent, receivingMode);
    }
}

