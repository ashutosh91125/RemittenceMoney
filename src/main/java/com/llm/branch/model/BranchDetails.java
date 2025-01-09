package com.llm.branch.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "branch_details")
public class BranchDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String agent;

    @Column(name = "branch_mode")
    private String branchMode;

    @Column(name = "branch_type")
    private String branchType;

    @Column(name = "cdp_channel")
    private String cdpChannel;//cdp
    
    private String raasChannel;

    @Column(name = "branch_channel_id")
    private String branchChannelId;

    @Column(name = "branch_name")
    private String branchName;

    @Column(name = "branch_display_name")
    private String branchDisplayName;

    private String address1;
    private String address2;
    private String address3;

    private String city;
    private String state;
    private String county;

    @Column(name = "zip_or_pobox")
    private String zip;

    @Column(name = "working_hours")
    private String workingHours;

    private String email;
    private String mobile;
    private String phone;

    @Column(name = "contact_person")
    private String contactPerson;

    @Column(name = "mis_emailid")
    private String misEmailId;

    @Column(name = "branch_location_id")
    private String branchLocationId;

    @Column(name = "licence_no")
    private String licenceNo;

    @Column(name = "outlet_code")
    private String outletCode;

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

    private String remarks;
    private boolean status;
}
