package com.llm.staff.model.dto;

import com.llm.UserIdentity.model.enums.Role;
import lombok.Data;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Data
public class StaffDTO {

    private String branch;
    private Role staffGroup;
    private String firstName;
    private String middleName;
    private String lastName;
    private String username;
    private String password;
    private String email;
    private String mobile;
    private String createdBy;
    private LocalDateTime createdOn;
    private String modifiedBy;
    private LocalDateTime modifiedOn;
    private String disabledBy;
    private LocalDateTime disabledOn;
    private String remarks;
    private boolean status;
}