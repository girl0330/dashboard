package com.job.dashboard.domain.member;

import lombok.Data;

@Data
public class MemberDTO {
    private int uuid;
    private String memberId;
    private String password;
    private String name;
    private String email;
    private String phoneNumber;
    private String businessRegistrationNumber;
    private String gradeCode;
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;
}
