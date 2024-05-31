package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PersonalDashDTO extends UserDTO{
    private int profileId;
    private int userNo;
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
