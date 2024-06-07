package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class CompanyInfoDTO {
    private int companyId;
    private int userNo;
    private String companyName;
    private String companyDescription;
    private String address;
    private String industryCode;
    private String industryCodeName;
    private String businessTypeCode;
    private String businessTypeCodeName;
    private int businessNumber;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
