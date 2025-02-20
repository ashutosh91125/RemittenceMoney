package com.llm.receipt.controller;

import com.llm.receipt.dto.ReceiptDTO;
import com.llm.receipt.model.Receipt;
import com.llm.receipt.service.ReceiptService;
import com.llm.transfer.model.Transfer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    /**
     * Get the receipt details by transaction reference number.
     *
     * @param transactionRefNumber The transaction reference number.
     * @return The receipt details.
     */
    @GetMapping("/{transactionRefNumber}")
    public ResponseEntity<Receipt> getReceiptByTransactionRefNumber(@PathVariable String transactionRefNumber) {
        Receipt receipt = receiptService.getReceiptByTransactionRefNumber(transactionRefNumber);

        if (receipt == null) {
            // If no receipt found, return a 404 response
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // If receipt is found, return the details with a 200 OK status
        return new ResponseEntity<>(receipt, HttpStatus.OK);
    }
}

