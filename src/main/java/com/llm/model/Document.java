package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "document")
public class Document {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "document_id", length = 50, nullable = false)
    private String document_id;

    @Column(name = "base64_data",columnDefinition = "TEXT")
    private String base64_data;

    @Column(name = "content_type", length = 50, nullable = false)
    private String content_type;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customer_id")
    @JsonBackReference
    private Customer customer;
}
