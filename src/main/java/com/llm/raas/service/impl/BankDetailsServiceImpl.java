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
import java.util.Optional;

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
    public List<Bank> getAllBanks() {

        return bankRepository.findAll();
    }

    @Override
    public List<Branch> getAllBranch() {
        return branchRepository.findAll();
    }

    public Bank getBankById(String bankId) {
        Optional<Bank> bank = bankRepository.findById(bankId);
        if (bank.isPresent()) {
            return bank.get();
        } else {
            throw new RuntimeException("Bank not found with id: " + bankId); // You can customize the exception handling
        }
    }

    public Branch getBranchById(String branchId) {
        return branchRepository.findById(branchId)
                .orElseThrow(() -> new RuntimeException("Bank not found with id: " + branchId));
    }

    public List<Branch> getBranchesByBankId(String bankId) {
        List<Branch> branches = branchRepository.findByBankId(bankId);
        if (branches.isEmpty()) {
            throw new RuntimeException("Branch not found with bank Id: " + bankId);
        }
        return branches;
    }

    public Branch getBranchByRoutingCode(String routingCode){
        return branchRepository.findByRoutingCode(routingCode);
    }

    @Override
    public List<Bank> getBankByCountryCode(String countryCode){
        return bankRepository.findByCountryCode(countryCode);
    }

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
                        newBank.setCountryCode(receivingCountryCode);
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
    public void fetchAndStoreBranches(String receivingCountryCode, String correspondent, String receivingMode) {

        List<Bank> banks = getBankByCountryCode(receivingCountryCode);

        for (Bank bank: banks) {
            try {
                // Call getBranches() to fetch data from the external service
                Map<String, Object> response = externalService.getBankBranches(bank.getBankId(), receivingCountryCode, correspondent, receivingMode);

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

            } catch (Exception e){
                System.out.println("No valid data received from the API.");
            }
        }
    }


    @Scheduled(cron = "0 0 0 * * SUN") // Runs every Sunday at midnight
    public void scheduledTask() {
        fetchAndStoreBanks("IN","BANK");
    }

    @Scheduled(cron = "0 0 0 * * SUN") // Runs every Sunday at midnight
    public void updateBranches() {
        String receivingCountryCode = "IN";
        String correspondent = "LR";
        String receivingMode = "BANK";
        fetchAndStoreBranches(receivingCountryCode, correspondent, receivingMode);
    }
}

