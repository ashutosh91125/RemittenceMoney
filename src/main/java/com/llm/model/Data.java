package com.llm.model;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@lombok.Data
@AllArgsConstructor
@RequiredArgsConstructor
public  class Data {
        private String amlScanStatus;
        private String ecrn;
        private String customerStatus;
        private boolean pep;
        private int amlCategory;
 }