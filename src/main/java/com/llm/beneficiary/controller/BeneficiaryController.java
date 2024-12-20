package com.llm.beneficiary.controller;

import com.llm.beneficiary.model.dto.BeneficiaryListDTO;
import com.llm.beneficiary.model.entity.BeneficiaryDetails;
import com.llm.beneficiary.service.BeneficiaryService;
import com.llm.beneficiary.util.ApiResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/beneficiaries")
public class BeneficiaryController {

    private final BeneficiaryService beneficiaryService;

    public BeneficiaryController(BeneficiaryService beneficiaryService) {
        this.beneficiaryService = beneficiaryService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> createBeneficiary(@RequestBody BeneficiaryDetails beneficiaryDetails) {
        try {
            BeneficiaryDetails savedBeneficiary = beneficiaryService.saveBeneficiary(beneficiaryDetails);
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiary created successfully", savedBeneficiary));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error creating beneficiary: " + e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getBeneficiaryById(@PathVariable Long id) {
        try {
            BeneficiaryDetails beneficiary = beneficiaryService.getBeneficiaryById(id);
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiary fetched successfully", beneficiary));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error fetching beneficiary: " + e.getMessage()));
        }
    }

    @GetMapping("/get-by-ecrn/{ecrn}")
    public ResponseEntity<ApiResponse> getBeneficiariesByEcrn(@PathVariable String ecrn) {
        try {
            List<BeneficiaryDetails> beneficiaries = beneficiaryService.getBeneficiariesByEcrn(ecrn);
            if (beneficiaries.isEmpty()) {
                return ResponseEntity.ok(new ApiResponse(true, "No beneficiaries found with the provided ECRN"));
            }
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiaries fetched successfully", beneficiaries));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error fetching beneficiaries: " + e.getMessage()));
        }
    }

    @GetMapping("/get-list-by-ecrn/{ecrn}")
    public ResponseEntity<ApiResponse> getBeneficiaryListByEcrn(@PathVariable String ecrn) {
        try {
            List<BeneficiaryListDTO> beneficiaries = beneficiaryService.getBeneficiaryListByEcrn(ecrn);
            if (beneficiaries.isEmpty()) {
                return ResponseEntity.ok(new ApiResponse(true, "No beneficiaries found with the provided ECRN"));
            }
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiaries fetched successfully", beneficiaries));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error fetching beneficiaries: " + e.getMessage()));
        }
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllBeneficiaries() {
        try {
            List<BeneficiaryDetails> beneficiaries = beneficiaryService.getAllBeneficiaries();
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiaries fetched successfully", beneficiaries));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error fetching beneficiaries: " + e.getMessage()));
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateBeneficiary(@PathVariable Long id, @RequestBody BeneficiaryDetails beneficiaryDetails) {
        try {
            BeneficiaryDetails updatedBeneficiary = beneficiaryService.updateBeneficiary(id, beneficiaryDetails);
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiary updated successfully", updatedBeneficiary));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error updating beneficiary: " + e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteBeneficiary(@PathVariable Long id) {
        try {
            beneficiaryService.deleteBeneficiary(id);
            return ResponseEntity.ok(new ApiResponse(true, "Beneficiary deleted successfully"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse(false, "Error deleting beneficiary: " + e.getMessage()));
        }
    }
}
