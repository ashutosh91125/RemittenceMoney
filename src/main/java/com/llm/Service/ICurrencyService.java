package com.llm.Service;

import java.util.List;

import com.llm.model.Currency;

public interface ICurrencyService {
	public List<Currency> fetchCurrencies();
	public Currency getCurrecyById(Integer currencyId);

}
