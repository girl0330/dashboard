package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class JobApplicationDTO extends JobPostDTO{
    private int applicationId;
    private int jobId;
    private int userId;
    private String statusTypeCode;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
