package com.llm.common.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "enum_entity_values")
@AllArgsConstructor
@NoArgsConstructor
public class EnumEntity {

    @Id
    @Column(name = "`key`")
    private String key;

    // Unidirectional relationship to EnumValue
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "enum_entity_key") // Foreign key column in EnumValue
    private List<EnumValue> values;
}
