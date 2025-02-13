package com.llm.fundRequst.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class DepositRequestDto {
    private Double amount;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate depositDate;
    private String depositMode;
    private Long referenceNumber;
    private String depositBy;
    private String remarks;
}
