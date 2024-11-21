package com.llm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.ICurrencyService;
import com.llm.model.Currency;

@Controller
public class CurrencyController {
	@Autowired
	private ICurrencyService currencyService;

	@GetMapping("/listCurrencies")
	public List<Currency> getAllCurrencies() {
		List<Currency> listCurrencies = currencyService.fetchCurrencies();
		return listCurrencies;
	}

}
