package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class JobApplicationDTO {
    private int applicationId;
    private int jobId;
    private int userId;
    private String statusTypeCode;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
