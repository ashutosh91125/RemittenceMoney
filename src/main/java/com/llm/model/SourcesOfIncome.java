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
@Table(name = "SourcesOfIncome")
public class SourcesOfIncome {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sourcesOfIncomeId;
	private String id;
	private String value;

}
