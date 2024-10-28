package com.llm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@ToString
@Table(name = "IdTypes")
public class IdTypes {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idTypeId;
	private Long idType;
	private String idName;

}
