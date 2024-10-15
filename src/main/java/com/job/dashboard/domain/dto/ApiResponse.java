package com.job.dashboard.domain.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ApiResponse<T> {
    private int code;
    private String message;
    private T data;
    private String redirectUrl;

}