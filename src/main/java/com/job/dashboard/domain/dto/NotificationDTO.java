package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class NotificationDTO {
    private int notifyId;
    private int userNo;
    private int receiverId; // 수신자 아이디
    private int giverId; //발신자 아이디
    private String name;
    private String message; // 수신자가 받게될 내용
    private String url; //이동할 주소
    private String notifyTypeCode;// (좋아요 알람, 지원신청 알람, 채용 알람)
    private String userTypeCode;
    private String isRead;
    private int systemRegisterId;
    private String systemRegisterDatetime;

    public NotificationDTO(int userNo, String message, String notifyTypeCode) {
        this.userNo = userNo;
        this.message = message;
        this.notifyTypeCode = notifyTypeCode;
    }
}