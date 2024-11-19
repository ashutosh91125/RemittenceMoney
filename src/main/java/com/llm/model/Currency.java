package com.llm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "Currencies")
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Currency {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer currencyId;
	private String ccycode;
	private String ccyname;
	@ManyToOne
	private Country countries;
	@ManyToOne
	private Agent agents;

}
