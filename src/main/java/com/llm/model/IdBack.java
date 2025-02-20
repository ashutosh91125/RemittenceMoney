package com.llm.model;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.llm.iddetail.model.IdDetail;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "id_back")
public class IdBack {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name = "base64_data",columnDefinition = "TEXT")
    private String base64Data;

    @Column(name = "content_type")
    private String contentType;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_Back_id")
    @JsonBackReference
    private IdDetail idDetail;
}
