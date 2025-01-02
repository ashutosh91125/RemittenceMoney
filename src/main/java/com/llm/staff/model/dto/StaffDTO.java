package com.llm.staff.model.dto;

import com.llm.UserIdentity.model.enums.Role;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class StaffDTO {
    private String agent;
    private List<String> branches;
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