package com.llm.fundRequst.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.llm.fundRequst.dto.DepositRequestDto;
import com.llm.fundRequst.dto.DepositResponseDto;
import com.llm.fundRequst.model.DepositRequest;
import com.llm.fundRequst.response.ApiResponse;
import com.llm.fundRequst.service.DepositRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/deposit")
@RequiredArgsConstructor
public class DepositRequestController {

    private final DepositRequestService depositRequestService;

    @PostMapping(value = "/save", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ApiResponse<DepositRequest> saveDepositRequest(
            @RequestPart("data") String dataJson,
            @RequestPart("bankReceipt") MultipartFile bankReceipt, Authentication authentication) {

        try {
            // Convert JSON string to DTO
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule()); // Register JavaTimeModule
            DepositRequestDto dto = objectMapper.readValue(dataJson, DepositRequestDto.class);

            return depositRequestService.saveDepositRequest(dto, bankReceipt, authentication.getName());
        } catch (Exception e) {
            return new ApiResponse<>(false, "Error parsing request: " + e.getMessage(), null);
        }
    }


    @GetMapping("/file/{fileName}")
    public ResponseEntity<ByteArrayResource> getFile(@PathVariable String fileName) {
        try {
            byte[] fileData = Files.readAllBytes(Paths.get("D:/SMD/LLM/uploads/receipts/", fileName));
            ByteArrayResource resource = new ByteArrayResource(fileData);

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ApiResponse<DepositResponseDto> getDepositById(@PathVariable Long id) {
        return depositRequestService.getDepositById(id);
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<Resource> downloadFile(@PathVariable Long id) {
        return depositRequestService.downloadFile(id);
    }
}
