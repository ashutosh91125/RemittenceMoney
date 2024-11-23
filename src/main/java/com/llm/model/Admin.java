package com.llm.model;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "Admin")
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long adminId;
	private String adminName;
	private String email;
	private String password;
	private String confirmPassword;
	private String userName;
	private Boolean satus;
	@Column(name = "Phone")
	private Long phone;
	private String countries;
	@Lob
	@Basic(fetch = FetchType.LAZY)
	private byte[] profileImage;
	public Admin(Long adminId, String email, String password) {
		super();
		this.adminId = adminId;
		this.email = email;
		this.password = password;
	}
	

}
