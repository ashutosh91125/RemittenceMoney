package com.llm.comp;
import java.io.IOException;

import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

@Component
public class FaviconFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code (if needed)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        if (req.getRequestURI().endsWith("favicon.ico")) {
            // Ignore favicon requests
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code (if needed)
    }
}
