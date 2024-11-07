package com.llm.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Address;
import com.llm.repositories.AddressRepositories;

@Service
public class AddressService {
	@Autowired
	private AddressRepositories addressRepositories;

	public Address getAddressById(Long id) {
		return addressRepositories.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Address not found with id: " + id));
	}

}
