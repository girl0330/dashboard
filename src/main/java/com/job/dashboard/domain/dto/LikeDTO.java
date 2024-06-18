package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class LikeDTO {
    private int likeId;
    private int userNo;
    private int jobId;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}

