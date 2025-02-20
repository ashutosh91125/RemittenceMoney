package com.llm.receipt.service;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;

import java.io.PrintWriter;
import java.io.StringWriter;

public class CustomResponseWrapper extends HttpServletResponseWrapper {
    private final StringWriter stringWriter;

    public CustomResponseWrapper(HttpServletResponse response, StringWriter stringWriter) {
        super(response);
        this.stringWriter = stringWriter;
    }

    @Override
    public PrintWriter getWriter() {
        return new PrintWriter(stringWriter);
    }
}
