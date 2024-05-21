package com.job.dashboard.domain.business;

import lombok.Data;

@Data
public class BDashboardDTO {

    private int jobPostId;
    private int memberUuid;
    private String title; //
    private String content; //
    private String manager;//
    private String email;//
    private String deadLine;//
    private String employmentType;//
    private String numberOfStaff;//
    private String workType;//
    private String salaryType;//
    private String salary;//
    private String otherSalary;//
    private String workingHours;//
    private String workingDays;//
    private String workingTime;//
    private String gender;//
    private String qualifications;//
    private String etc;//
    private String location;
    private int views;
    private int likes;
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;
}
