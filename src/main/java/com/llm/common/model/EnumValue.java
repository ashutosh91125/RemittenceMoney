package com.llm.common.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "enum_values")
@AllArgsConstructor
@NoArgsConstructor
public class EnumValue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "value_id")
    private String valueId;

    @Column(name = "description")
    private String description;

    private String dependent;

    public String getDisplayName() {
        return this.valueId + " - " + this.description;
    }

    // No reference to EnumEntity here, making it unidirectional
}
