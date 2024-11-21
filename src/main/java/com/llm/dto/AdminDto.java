package com.llm.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.llm.model.Country;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Getter
@Setter
public class AdminDto {
	private Long adminId;
	private String adminName;
	private String email;
	private String password;
	private String confirmPassword;
	private Long phone;
	private String userName;
	private Boolean satus;
	private String countries;
	public MultipartFile profileImagePath;

	public AdminDto(Long adminId, String email, String password) {
		super();
		this.adminId = adminId;
		this.email = email;
		this.password = password;
	}
	

}
