package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.llm.model.Country;
import com.llm.repositories.CountriesRepositories;

@Service
public class CountryServiceImpl implements ICountryService {

	@Autowired
	private CountriesRepositories countryRepo;

	@Override
	public Country addCountries(Country country) {
		return countryRepo.save(country);
	}

	@Override
	public Page<Country> getCountry(Pageable pageable) {
		return countryRepo.findAll(pageable);
	}

	@Override
	public List<Country> fetchCountries() {
		return countryRepo.findAll();
	}

	@Override
	public Country findByCountryId(Integer countryId) {
		return countryRepo.findById(countryId)
				.orElseThrow(() -> new IllegalArgumentException("Country not available: " + countryId));
	}

	@Override
	public Country getCountryByCode(String countryCode) {
		return countryRepo.findByCountryCode(countryCode);
	}

//	@Override
//	public Country findByName(String countryName) {
//		return countryRepo.findCountryByName(countryName)
//				.orElseThrow(() -> new IllegalArgumentException("Country not available: " + countryName));
//	}
}
