package com.job.dashboard.domain.member;

import lombok.Data;

@Data
public class MemberDTO {
    private int uuid;
    private String memberId; // 회원가입한 아이디
    private String password; // 회원가입한 비밀번호
    private String password2; // 회원가입한 비밀번호
    private String name; // 회원가입한 이름
    private String email; // 회원가입한 이메일
    private String phoneNumber; // 회원가입한 핸드폰 번호
    private String businessRegistrationNumber; // 기업회원 사업자번호
    private String gradeCode; // 가입한 타입저장
    private String birthDay; // 회원가입한 생년월일
    private String gender; // 개인회원 성별
    private String address; // 회원들 주소
    private String education; // 개인회원 학력
    private String experience; // 개인회원 경험
    private String skills; // 개인회원 스킬
    private String awards; // 개인회원 수상
    private String companyName; // 기업회원 회사이름
    private String manager; // 기업회원 회사 담당자이름
    private String registrarId;
    private String registrarDatetime;
    private String modifierId;
    private String modifierDatetime;
}
