package com.job.dashboard.domain.parsonalDashboard;

import lombok.Data;

@Data
public class PDDTO {

    private int personalId;
    private int memberUuid;
    private String name;
    private String email;
    private String birthDay;
    private String phoneNumber;
    private String gender;
    private String content;
    private String address;
    private String education;
    private String experience;
    private String skills;
    private String awards;
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;
}
