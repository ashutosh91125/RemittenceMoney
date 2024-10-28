package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "social_link")
public class SocialLink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, updatable = false)
    private Long id;

    @JsonProperty("social_links_id")
    @Column(name = "social_links_id")
    private Integer socialLinksId;

    @JsonProperty("text_field")
    @Column(name = "text_field", length = 255)
    private String textField;

    // Establishing the relationship to CustomerClassification
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "customer_classification_id", referencedColumnName = "id") // Map to correct FK column
    private CustomerClassification customerClassification;
}
