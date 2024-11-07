package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Address;

public interface AddressRepositories extends JpaRepository<Address, Long> {

}
