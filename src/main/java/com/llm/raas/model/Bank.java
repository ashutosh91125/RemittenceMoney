package com.llm.raas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Bank {

    @Id
    private String bankId;
    private String bankName;

}
