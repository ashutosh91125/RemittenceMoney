package com.llm.receipt.service;

import java.io.ByteArrayOutputStream;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.Base64;
import java.util.Map;

import com.llm.transfer.model.Transfer;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;

@Service
public class ReceiptService {
    private final ServletContext servletContext;

    public ReceiptService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String generateReceiptPdf(Transfer transfer, HttpServletRequest request, HttpServletResponse response) {
        try {
            // Use reflection to set attributes dynamically
            for (Field field : transfer.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                request.setAttribute(field.getName(), field.get(transfer));
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
                return Base64.getEncoder().encodeToString(outputStream.toByteArray());
            }
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);
        }
    }
}

