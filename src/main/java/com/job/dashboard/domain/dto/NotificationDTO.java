package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class NotificationDTO {
    private Long notifyId;
    private int userNo;
    private String message;
    private String notifyTypeCode;
    private String showYn;

    public NotificationDTO(int userNo, String message, String notifyTypeCode) {
        this.userNo = userNo;
        this.message = message;
        this.notifyTypeCode = notifyTypeCode;
    }
}