package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class JobApplicationDTO extends JobPostDTO{
    private int applicationId;
    private int jobId;
    private int userNo;
    private String statusTypeCode;
    private String statusTypeCodeName;
    private String statusTypeCode2;
    private String statusTypeCodeName2;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
    private String jobTypeCodeName;
    private String salaryTypeCodeName;
    private String motivationDescription;
    private String name;
    private String phone;
    private String birth;
    private String gender;
    private int old; // 나이
    private int countApplication; //지원자 수
    private int loginUserNo;
}
