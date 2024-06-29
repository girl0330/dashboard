package com.job.dashboard.domain.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;

@EqualsAndHashCode(callSuper = true)
@Data
public class JobPostDTO extends UserDTO  {

    private int jobId; // 공고 번호
    private int userNo; // 로그인한 회원 아이디
    private String title; // 공고 제목 -
    private String description; // 공고 내용-

    private String zipcode; //우편번호
    private String address; //도로명주소
    private String addressDetail; //상세주소
    private double latitude; //위도
    private double longitude; //경도

    private String jobTypeCode; // 일자리타입코드(서빙, 편의점, 주방 등등)-
    private String jobTypeCodeName;
    private String salaryTypeCode; // 급여종류코드(일급, 주급, 시급, 월급 등등)-
    private String salaryTypeCodeName;
    private String salary; // 임금-
    private String jobTime; // 근무 시간--
    private String jobDayTypeCode; // 근무날짜종류코드(day -1 week -일주일, mon -월등등)-
    private String jobDayTypeCodeName;
    private String managerNumber; // 매니저 연락처--
    private String requirement; // 요구 조건(학력, 자격증, 경험자)-
    private int numberOfStaff; // 모집인원-
    private String employmentTypeCode; // 고용 유형 코드(단기, 장기등등)
    private String employmentTypeCodeName;
    private String etc; // 기타사항
    private String statusTypeCode;
    private String statusTypeCodeName;
    private int countApplication;

    private int systemRegisterId;
    private String systemRegisterDatetime;
    private int systemUpdaterId;
    private String systemUpdateDatetime;

    private String keyword; //검색어
    private int totalJobs; // 총 게시물 수
    private int totalPages; // 총 페이지 수
    private String daysAgo; // 며칠 전 계산

    private MultipartFile file; //파일
    private int fileId;

    private int likeId; //좋아요

    private String companyName; // 회사 이름
    private String officePhone;//회사 전화번호
    private String email;//이메일
    private String jaiStatusTypeCode;
    private String jaiStatusTypeCodeName;
    private String userStatusCode;
}
