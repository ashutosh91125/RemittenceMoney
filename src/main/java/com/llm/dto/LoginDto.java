package com.llm.dto;

import java.util.List;

import com.llm.model.Country;

import lombok.Data;

@Data
public class LoginDto {
	private String email;
	private String password;
	private List<Country> countries;

}
