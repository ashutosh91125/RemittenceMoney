package com.llm.receipt.service;

import java.io.ByteArrayOutputStream;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Map;

import com.llm.receipt.dto.ReceiptDTO;
import com.llm.receipt.model.Receipt;
import com.llm.receipt.repository.ReceiptRepository;
import com.llm.transfer.model.Transfer;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
    private final ServletContext servletContext;
    private final ReceiptRepository receiptRepository;

    public ReceiptService(ServletContext servletContext, ReceiptRepository receiptRepository) {
        this.servletContext = servletContext;
        this.receiptRepository = receiptRepository;
    }

    public String generateReceiptPdf(ReceiptDTO receiptDTO, HttpServletRequest request, HttpServletResponse response) {
        try {
            // Use reflection to set attributes dynamically
            for (Field field : receiptDTO.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                request.setAttribute(field.getName(), field.get(receiptDTO));
            }

            // Render JSP to HTML
            StringWriter stringWriter = new StringWriter();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/views/receipt.jsp");
            dispatcher.include(request, new CustomResponseWrapper(response, stringWriter));
            String htmlContent = stringWriter.toString();

            // Convert HTML to PDF
            try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                PdfRendererBuilder builder = new PdfRendererBuilder();
                builder.useFastMode();
                builder.toStream(outputStream);
                builder.withHtmlContent(htmlContent, "file:///");
                builder.run();

                // Convert PDF to Base64
                String base64Pdf = Base64.getEncoder().encodeToString(outputStream.toByteArray());

                // Save receipt to database
                Receipt fetchReceipt = receiptRepository.findByTransactionRefNumber(receiptDTO.getTransactionRefNumber());
                if (fetchReceipt != null){
                    fetchReceipt.setReceiptBase64Data(base64Pdf);
                    receiptRepository.save(fetchReceipt);
                }else {
                    Receipt receipt = new Receipt(receiptDTO.getTransactionRefNumber(), base64Pdf, LocalDateTime.now());
                    receiptRepository.save(receipt);
                }


                return base64Pdf;
            }
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);
        }
    }
    @Transactional
    public Receipt getReceiptByTransactionRefNumber(String transactionRefNumber){
        return receiptRepository.findByTransactionRefNumber(transactionRefNumber);
    }
}

