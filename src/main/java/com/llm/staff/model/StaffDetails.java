package com.llm.staff.model;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "staff_details")
public class StaffDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "branches")
    @ElementCollection(fetch = FetchType.EAGER)
    private List<Long> branches;

    private String branchLocationId;

    private String agent;

    private String country;

    private String staffGroup;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "user_name", unique = true)
    private String username;

    private String email;
    private String mobile;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @Column(name = "modified_by")
    private String modifiedBy;

    @Column(name = "modified_on")
    private LocalDateTime modifiedOn;

    @Column(name = "disabled_by")
    private String disabledBy;

    @Column(name = "disabled_on")
    private LocalDateTime disabledOn;

    @Column(name = "remarks")
    private String remarks;

    private boolean status;
    @Transient
    private String staffCraetedDateFormated;
}
