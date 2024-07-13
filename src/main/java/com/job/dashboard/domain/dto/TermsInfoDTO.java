package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class TermsInfoDTO {
    private int termId;
    private String termsTypeCode;
    private String termsTypeName;
    private String termsContent;
    private String version;
    private String systemRegisterId;
    private int systemUpdateId;
    private String systemUpdateDatetime;
}