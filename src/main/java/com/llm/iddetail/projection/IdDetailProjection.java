package com.llm.iddetail.projection;

public interface IdDetailProjection {

    Integer getIdType();
    String getIdNumber();
    String getVisaNumber();
    String getVisaExpiryDate();
    String getNameAsPerId();
    String getIssuedCountry();
    String getIssuedBy();
    String getIssuedAt();
    String getIssuedOn();
    String getDateOfExpiry();
    Boolean getDefaultStatus();
    Boolean getActiveStatus();
    String getVisaType();
}
