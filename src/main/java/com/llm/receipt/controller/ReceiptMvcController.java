package com.llm.receipt.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.common.service.EnumEntityService;
import com.llm.customer.model.Customer;
import com.llm.customer.repository.CustomerRepository;
import com.llm.raas.repository.BankRepository;
import com.llm.raas.repository.BranchRepository;
import com.llm.receipt.dto.ReceiptDTO;
import com.llm.transfer.model.Transfer;
import com.llm.transfer.repository.TransferRepository;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDate;
import java.util.Optional;

@Controller
@AllArgsConstructor
public class ReceiptMvcController {

    private final TransferRepository transferRepository;
    private final CustomerRepository customerRepository;
    private final EnumEntityService enumEntityService;
    private final UserRepository userRepository;
    private final BankRepository bankRepository;
    private final BranchRepository branchRepository;

    @GetMapping("/receipt/{transactionRefNumber}")
    @Transactional
    public String receiptPage(@PathVariable String transactionRefNumber, Model model){
        ReceiptDTO receiptDTO = new ReceiptDTO();
        Optional<Transfer> transfer = transferRepository.findTransactionByTransactionReferenceNumber(transactionRefNumber);
        if (transfer.isPresent()) {
            Transfer savedTransfer = transfer.get();
            Optional<User> user = userRepository.findByUsername(savedTransfer.getUsername());
            Customer customer = customerRepository.findByEcrn(savedTransfer.getEcrn());
            String occupation = enumEntityService.getEnumValueDescriptionByKeyAndValueId("occupationId", String.valueOf(customer.getOccupationId()));
            String customerIdTpe = enumEntityService.getEnumValueDescriptionByKeyAndValueId("idTypes", savedTransfer.getIdType());
            String nationality = enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", savedTransfer.getBeneficiaryNationality());
            String bankName = bankRepository.findById(savedTransfer.getBeneficiaryBank()).get().getBankName();
            String bankBranchName = (branchRepository.findByRoutingCode(savedTransfer.getBeneficiaryBranch()).getBranchName());

            receiptDTO.setTransactionRefNumber(savedTransfer.getTransactionReferenceNumber());
            receiptDTO.setDate(LocalDate.now());
            receiptDTO.setCustomerNo(savedTransfer.getEcrn());
            receiptDTO.setPayoutAmount(savedTransfer.getPayoutAmount());
            receiptDTO.setPayOutCurrency(savedTransfer.getCurrencies());
            receiptDTO.setCustomerName(savedTransfer.getFirstName() + " " + savedTransfer.getLastName());
            receiptDTO.setCustomerPhone(savedTransfer.getPrimaryMobileNumber());
            receiptDTO.setCustomerIdType(customerIdTpe);
            receiptDTO.setCustomerIdNo(savedTransfer.getIdNumber());
            receiptDTO.setIdDateOfExpiry(savedTransfer.getDateOfExpiry());
            receiptDTO.setNationality(savedTransfer.getNationality());
            receiptDTO.setIssuedAt(savedTransfer.getIssuedBy());
            receiptDTO.setSourceOfFund(savedTransfer.getSourceOfFund());
            receiptDTO.setPurposeOfTxn(savedTransfer.getTransactionPurpose());
            receiptDTO.setCustomerCity(savedTransfer.getAddress1());
            receiptDTO.setEmployerName(customer.getEmployerName());
            receiptDTO.setOccupation(occupation);
            receiptDTO.setPayInAmount(savedTransfer.getPayInAmount());
            receiptDTO.setPayInCurrency(savedTransfer.getPayInCurrency());
            receiptDTO.setCommission(savedTransfer.getCommission());
            receiptDTO.setRate(savedTransfer.getRate());
            receiptDTO.setTax(savedTransfer.getTax());
            //receiptDTO.setOtherCharges(savedTransfer.getOtherCharges()); // If available
            receiptDTO.setTotalPayInAmount(savedTransfer.getTotalPayInAmount());
            receiptDTO.setBeneficiaryName(savedTransfer.getBeneficiaryFirstName() + " " + savedTransfer.getBeneficiaryLastName());
            receiptDTO.setBeneficiaryPhone(savedTransfer.getBeneficiaryMobile());
            receiptDTO.setBeneficiaryRelation(savedTransfer.getBeneficiaryRelation());
            receiptDTO.setBeneficiaryNationality(nationality);
            receiptDTO.setBenBank(bankName);
            receiptDTO.setBenBranch(bankBranchName);
            receiptDTO.setIban(savedTransfer.getBeneficiaryIban());
            receiptDTO.setAccountNo(savedTransfer.getBeneficiaryAccountNo());
            receiptDTO.setRemarks(savedTransfer.getRemarks());
            receiptDTO.setBeneficiaryAddress(savedTransfer.getBeneficiaryAddress1() + " " + savedTransfer.getBeneficiaryAddress2());
            receiptDTO.setCreatedBy(user.get().getAdminName());

        }

        model.addAttribute("receiptDetails", receiptDTO);

        return "receipt";
    }

}
