package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "profile_photo")
public class ProfilePhoto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "base64_data",columnDefinition = "TEXT")
    private String base64Data;
    @Column(name = "content_type")
    private String contentType;

    @OneToOne
    @JoinColumn(name = "customerClassification_id", referencedColumnName = "id")
    @JsonBackReference
    private CustomerClassification customerClassification;
}