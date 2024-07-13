package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class TermsInfoHistory {
    private int termsHistoryId;
    private  int userNo;
    private int termsId;
    private String status;
    private String timestamp;
}