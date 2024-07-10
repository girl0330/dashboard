package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class NotificationDTO {
    private Long notifyId;
    private int userNo;
    private String name;
    private String message;
    private String notifyTypeCode;
    private int userTypeCode;
    private String showYn;
    private int systemRegisterId;
    private String systemRegisterDatetime;

    public NotificationDTO(int userNo, String message, String notifyTypeCode) {
        this.userNo = userNo;
        this.message = message;
        this.notifyTypeCode = notifyTypeCode;
    }
}