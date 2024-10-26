package com.llm.model;

import java.util.List;

public interface AdminWithoutProfile {

	Long adminId();

	String adminName();

	String email();

	String password();

	String confirmPassword();

	String userName();

	Boolean satus();

	List<Country> countries();

	Long phone();

}
