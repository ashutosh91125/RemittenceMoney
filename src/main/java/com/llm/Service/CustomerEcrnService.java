package com.llm.Service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class CustomerEcrnService {

	private final RestTemplate restTemplate;

	public CustomerEcrnService(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public String generateEcrn(String baseUrl) {
		String apiUrl = baseUrl + "/caas/api/v2/customer/ecrn"; // Append endpoint to base URL
		ResponseEntity<String> response = restTemplate.getForEntity(apiUrl, String.class);

		if (response.getStatusCode().is2xxSuccessful()) {
			// Assume the response body contains the ecrn directly
			return response.getBody();
		} else {
			throw new RuntimeException("Failed to generate ecrn: " + response.getStatusCode());
		}
	}
}