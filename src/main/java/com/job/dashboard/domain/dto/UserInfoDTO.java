package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.web.multipart.MultipartFile;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserInfoDTO extends UserDTO{
    private int profileId;
    private int userNo;
    private String name;
    private String phone;
    private String birth;
    private String gender;
    private String zipcode; //우편번호
    private String address; //도로명주소
    private String addressDetail; //상세주소
    private double latitude; //위도
    private double longitude; //경도
    private boolean partTimeExperience;
    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;
    private MultipartFile file;
    private int fileId;
    private int profileCount;
    private String loginTypeCode;
    private String email;
    private String userTypeCode;
}
