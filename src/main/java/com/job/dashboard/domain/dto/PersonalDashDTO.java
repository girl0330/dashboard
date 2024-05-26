package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PersonalDashDTO extends UserDTO{
    private int profileId;
    private int userId;
    private String name;
    private String phone;
    private String birth;
    private String gender;
    private String address;
    private boolean partTimeExperience;
}
