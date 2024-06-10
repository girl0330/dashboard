package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserProfileInfoDTO extends UserDTO{
    private int profileId;
    private int userNo;
    private String name;
    private String phone;
    private String birth;
    private String gender;
    private String zipcode; //우편번호
    private String address; //도로명주소
    private String addressDetail; //상세주소
    private boolean partTimeExperience;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;

}
