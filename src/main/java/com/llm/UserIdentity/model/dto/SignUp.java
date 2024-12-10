package com.llm.UserIdentity.model.dto;

import com.llm.UserIdentity.model.enums.Role;
import lombok.Data;

@Data
public class SignUp {

    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private Role role;
}
