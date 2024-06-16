package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class CompanyInfoDTO {
    private int companyId;
    private int userNo;
    private String companyName;
    private String companyDescription;
    private String zipcode; //우편번호
    private String address; //도로명주소
    private String addressDetail; //상세주소
    private double latitude; //위도
    private double longitude; //경도
    private String industryCode;
    private String industryCodeName;
    private String businessTypeCode;
    private String businessTypeCodeName;
    private int businessNumber;
    private String officePhone;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
