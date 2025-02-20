package com.llm.model.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseDTO {
    @JsonProperty("status_code")
    private int statusCode;
    @JsonProperty("status")
    private String gitStatus;
    private String message;
    private Object data;
}
