package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;



@Data
@Entity
@Table(name = "social_link")
public class SocialLink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "social_links_id")
    private long socialLinksId;

    @Column(name = "text_field")
    private String textField;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
}
