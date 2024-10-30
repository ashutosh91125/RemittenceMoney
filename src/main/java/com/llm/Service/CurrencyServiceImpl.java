package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Currency;
import com.llm.repositories.CurrencyRepository;

@Service
public class CurrencyServiceImpl implements ICurrencyService {
	@Autowired
	private CurrencyRepository currencyRepository;

	@Override
	public List<Currency> fetchCurrencies() {
		return currencyRepository.findAll();
	}

	@Override
	public Currency getCurrecyById(Integer currencyId) {

		return currencyRepository.findById(currencyId)
				.orElseThrow(() -> new IllegalArgumentException("currencyId not available: " + currencyId));
	}

	@Override
	public Currency getCurrencybyCode(String ccycode) {

		return currencyRepository.findByCcycode(ccycode);
	}

}
