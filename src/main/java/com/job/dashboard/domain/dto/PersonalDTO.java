package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class PersonalDTO {
    private int profileId;
    private int userId;
    private String name;
    private String phone;
    private String birth;
    private String gender;
    private String address;
    private boolean partTimeExperience;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
}
