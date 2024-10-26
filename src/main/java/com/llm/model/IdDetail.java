package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "id_detail")
public class IdDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_type")
    private int idType;

    @Column(name = "id_number", length = 30)
    private String idNumber;

/*    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;*/
}
