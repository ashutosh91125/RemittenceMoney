package com.llm.fundRequst.service;
import com.llm.fundRequst.dto.DepositRequestDto;
import com.llm.fundRequst.dto.DepositResponseDto;
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
import java.util.Optional;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

@Service
@RequiredArgsConstructor
public class DepositRequestService {

    private final DepositRequestRepository depositRequestRepository;
//    private static final String UPLOAD_DIR = "D:/SMD/LLM/uploads/receipts/";

    @Value("${file.upload-dir}")
    private String UPLOAD_DIR;

    public ApiResponse<String> saveDepositRequest(DepositRequestDto dto, MultipartFile bankReceipt) {
        try {
            // Check if reference number already exists
            if (depositRequestRepository.existsByReferenceNumber(dto.getReferenceNumber())) {
                return new ApiResponse<>(false, "Reference number already exists!", null);
            }

            // Save the uploaded file and get file path
            String filePath = saveFile(bankReceipt);

            // Map DTO to Entity
            DepositRequest depositRequest = new DepositRequest();
            depositRequest.setAmount(dto.getAmount());
            depositRequest.setDepositDate(dto.getDepositDate());
            depositRequest.setDepositMode(dto.getDepositMode());
            depositRequest.setReferenceNumber(dto.getReferenceNumber());
            depositRequest.setBankReceiptPath(filePath);
            depositRequest.setDepositBy(dto.getDepositBy());
            depositRequest.setRemarks(dto.getRemarks());

            depositRequestRepository.save(depositRequest);
            return new ApiResponse<>(true, "Deposit request saved successfully", null);
        } catch (Exception e) {
            return new ApiResponse<>(false, "Error saving deposit request: " + e.getMessage(), null);
        }
    }

    private String saveFile(MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("File is required.");
        }

        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return filePath.toString();
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
        Path path = Paths.get(UPLOAD_DIR).resolve(filePath);
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
}
