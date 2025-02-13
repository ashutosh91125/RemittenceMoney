package com.llm.fundRequst.service;
import com.llm.fundRequst.dto.DepositRequestDto;
import com.llm.fundRequst.model.DepositRequest;
import com.llm.fundRequst.repository.DepositRequestRepository;
import com.llm.fundRequst.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

@Service
@RequiredArgsConstructor
public class DepositRequestService {

    private final DepositRequestRepository depositRequestRepository;
    private static final String UPLOAD_DIR = "uploads/receipts/";

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

        // Ensure directory exists
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Save file with unique name
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return filePath.toString(); // Save this path in PostgreSQL
    }
}
