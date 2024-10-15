package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class UserDTO { //모든
    private int userNo;
    private String email;
    private String password;
    private String password2;
    private String newPassword;
    private String userTypeCode;
    private String userTypeCodeName;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
    private String loginTypeCode;
    private String name;
    private String phone;

}

