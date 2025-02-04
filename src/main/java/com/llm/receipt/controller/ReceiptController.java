package com.llm.receipt.controller;

import com.llm.receipt.dto.ReceiptDTO;
import com.llm.receipt.service.ReceiptService;
import com.llm.transfer.model.Transfer;
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
    public Map<String, String> generateReceipt(@RequestBody ReceiptDTO receiptDTO, HttpServletRequest request, HttpServletResponse response) {
        return Map.of("receipt_base", receiptService.generateReceiptPdf(receiptDTO, request, response));
    }
}

