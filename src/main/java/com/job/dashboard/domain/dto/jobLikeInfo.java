package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class jobLikeInfo {
    private int likeId;
    private int userId;
    private int jobId;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
