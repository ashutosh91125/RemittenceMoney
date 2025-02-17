package com.llm.fundRequst.service;
import com.llm.UserIdentity.model.User;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.common.service.EnumEntityService;
import com.llm.fundRequst.dto.DepositRequestDto;
import com.llm.fundRequst.dto.DepositResponseDto;
import com.llm.fundRequst.enums.FundRequestStatus;
import com.llm.fundRequst.model.DepositRequest;
import com.llm.fundRequst.repository.DepositRequestRepository;
import com.llm.fundRequst.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import java.time.LocalDateTime;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

@Service
@RequiredArgsConstructor
public class DepositRequestService {

    private final DepositRequestRepository depositRequestRepository;
    private final AgentRepositories agentRepositories;

    @Value("${file.upload-dir}")
    private String uploadDir;

    public ApiResponse<DepositRequest> saveDepositRequest(DepositRequestDto dto, MultipartFile bankReceipt, String username) {
        try {
            if (depositRequestRepository.existsByReferenceNumber(dto.getReferenceNumber())) {
                return new ApiResponse<>(false, "Reference number already exists!", null);
            }


            String filePath = saveFile(bankReceipt);

            Agent agent = agentRepositories.findByUsername(username);

            String agentAddress = agent.getAddress1()+ " " + agent.getCity() + " " + agent.getState();

            DepositRequest depositRequest = new DepositRequest();
            depositRequest.setAmount(dto.getAmount());
            depositRequest.setDepositDate(dto.getDepositDate());
            depositRequest.setDepositMode(dto.getDepositMode());
            depositRequest.setReferenceNumber(dto.getReferenceNumber());
            depositRequest.setBankReceiptPath(filePath);
            depositRequest.setDepositBy(dto.getDepositBy());
            depositRequest.setRemarks(dto.getRemarks());
            depositRequest.setCreatedBy(agent.getAgentName());
            depositRequest.setCreatedByUsername(username);
            depositRequest.setCreateOn(LocalDateTime.now());
            depositRequest.setFundRequestStatus(FundRequestStatus.PENDING);

            depositRequest.setDepositCurrency(agent.getCurrencies());
            depositRequest.setDepositBank(agent.getBankName());
            depositRequest.setDepositAcNumber(agent.getAccountNumber());
            depositRequest.setDepositBankBranch(agent.getBankName()+", "+agent.getBranchName());
            depositRequest.setAgentAddress(agentAddress);

            DepositRequest saveFundRequest = depositRequestRepository.save(depositRequest);
            return new ApiResponse<>(true, "Deposit request saved successfully", saveFundRequest);
        } catch (Exception e) {
            return new ApiResponse<>(false, "Error saving deposit request: " + e.getMessage(), null);
        }
    }

    private String saveFile(MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("File is required.");
        }

        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return filePath.toString();
    }

    public DepositRequest getById(Long id){
        Optional<DepositRequest> fetchedRequest = depositRequestRepository.findById(id);
        if (fetchedRequest.isEmpty()){
            throw new RuntimeException("Fund Request not found with id " +id);
        }
        return fetchedRequest.get();
    }

    public ApiResponse<DepositResponseDto> getDepositById(Long id) {
        Optional<DepositRequest> depositOpt = depositRequestRepository.findById(id);
        if (depositOpt.isEmpty()) {
            return new ApiResponse<>(false, "Deposit not found", null);
        }

        DepositRequest deposit = depositOpt.get();
        DepositResponseDto dto = new DepositResponseDto();
        dto.setId(deposit.getId());
        dto.setAmount(deposit.getAmount());
        dto.setDepositMode(deposit.getDepositMode());
        dto.setReferenceNumber(deposit.getReferenceNumber());
        dto.setDepositBy(deposit.getDepositBy());
        dto.setRemarks(deposit.getRemarks());
        dto.setDepositDate(deposit.getDepositDate().toString());
        dto.setDepositRequestNumber(deposit.getDepositRequestNumber());

        String fileDownloadUrl = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/api/deposit/download/")
                .path(deposit.getId().toString())
                .toUriString();

        dto.setBankReceiptPath(fileDownloadUrl);

        return new ApiResponse<>(true, "Deposit retrieved successfully", dto);
    }

    public ResponseEntity<Resource> downloadFile(Long id) {
        Optional<DepositRequest> depositOpt = depositRequestRepository.findById(id);
        if (depositOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        String filePath = depositOpt.get().getBankReceiptPath();
        Path path = Paths.get(uploadDir).resolve(filePath);
        try {
            Resource resource = new UrlResource(path.toUri());
            if (!resource.exists() || !resource.isReadable()) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    public List<DepositRequest> getAllByCreatedBy(String createdBy) {
        List<DepositRequest> depositRequests = depositRequestRepository.findByCreatedBy(createdBy);

        if (depositRequests.isEmpty()){
            return List.of();
        }
        return depositRequests;
    }
}
