package com.llm.Service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.llm.model.Country;

public interface ICountryService {

	public Country addCountries(Country country);

	public Page<Country> getCountry(Pageable pageable);

	public List<Country> fetchCountries();

	public Country findByCountryId(Integer countryId);

	public Country getCountryByCode(String countryCode);


}
