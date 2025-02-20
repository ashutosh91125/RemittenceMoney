package com.llm.raas.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Branch {

    @Id
    private String branchId;
    private String bankId;
    private String branchName;
    private String routingCode;
    private String isoCode;
    private String sort;
}

