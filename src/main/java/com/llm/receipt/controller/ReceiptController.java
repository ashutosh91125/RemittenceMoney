package com.llm.receipt.controller;

import com.llm.receipt.service.ReceiptService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/receipt")
public class ReceiptController {
    private final ReceiptService receiptService;

    public ReceiptController(ReceiptService receiptService) {
        this.receiptService = receiptService;
    }

    @PostMapping("/generate")
    public String generateReceipt(@RequestBody Map<String, Object> requestData, HttpServletRequest request, HttpServletResponse response) {
        return receiptService.generateReceiptPdf(requestData, request, response);
    }
}

