package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class NotificationDTO {
    private Long id;
    private Long userId;
    private String message;
    private String type;

    public NotificationDTO(Long userId, String message, String type) {
        this.userId = userId;
        this.message = message;
        this.type = type;
    }
}