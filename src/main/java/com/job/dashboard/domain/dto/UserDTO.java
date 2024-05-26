package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class UserDTO {
    private int userId;
    private String email;
    private String password;
    private String password2;
    private String newPassword;
    private String userTypeCode;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}

