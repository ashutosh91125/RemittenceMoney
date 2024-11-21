package com.llm.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name = "Countries")
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer countryId;

    private String countryCode;
    private String countryName;
    private String shortName;
    private String iso3;
    private String numCode;
    private Double phoneCode;
    private Integer countryNo;

    @ManyToOne
    private Agent agents; // Ensure this is correct

    @OneToMany(mappedBy = "countries", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Currency> currency;
    @ManyToOne
    private Admin admins;
}
