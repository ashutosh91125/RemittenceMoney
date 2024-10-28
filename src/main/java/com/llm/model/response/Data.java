package com.llm.model.response;

import com.llm.util.AMLScanStatus;

@lombok.Data
public  class Data {
        private String ecrn;
        private String customer_status;
        private AMLScanStatus aml_scan_status;
        private boolean pep;
        private String aml_category;

    }