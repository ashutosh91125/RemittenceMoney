package com.llm.transfer.model.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UpdateTransactionStateDTO {
    @JsonProperty("transaction_reference_number")
    private String transactionReferenceNumber;
    @JsonProperty("state")
    private String transactionState;
    @JsonProperty("sub_state")
    private String transactionSubState;
}