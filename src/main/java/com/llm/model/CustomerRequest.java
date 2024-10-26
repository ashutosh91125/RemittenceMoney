package com.llm.model;

import lombok.Data;

import java.util.List;

@Data
public class CustomerRequest {

    private String channel;
    private String firstName;
    private String salutation;
    private String middleName;
    private String lastName;
    private String preferredName;
    private String nationality;
    private String secondNationality;
    private int nativeRegion;
    private String dateOfBirth;
    private String countryOfBirth;
    private String placeOfBirth;
    private long residentTypeId;
    private String countryOfResidence;
    private String gender;
    private String mothersMaidenName;
    private String primaryMobileNumber;
    private String secondaryMobileNumber;
    private String emailId;
    private String phoneNumber;
    private long occupationId;
    private boolean politicalExposedPerson;
    private String updatedBy;
    private List<Document> additionalDocs;
    private List<Address> addressList;
    private List<IdDetail> idDetails;
    private CustomerClassification customerClassification;

}

