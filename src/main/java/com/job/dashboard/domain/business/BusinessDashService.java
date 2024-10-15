package com.job.dashboard.domain.business;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

public interface BusinessDashService {

    //프로필
    CompanyInfoDTO getBusinessProfileInfo(); //기업 프로필 가져오기
    ApiResponse insertProfile(CompanyInfoDTO companyInfoDTO); //기업 프로필 작성/수정


    PageInfo<JobPostDTO> getPostJobList(String keyword, int pageNum, int pageSize); //기업 작성한 공고 리스트


    //작성한 공고
    PageInfo<JobApplicationDTO> getCandidateList(String keyword, int pageNum, int pageSize, int jobId); //지원한 지원자 리스트
    JobApplicationDTO getCandidateDetailInfo(int userNo, int jobId); //지원자 상세보기

    //채용
    ApiResponse employCandidate(JobApplicationDTO jobApplicationDTO);
    ApiResponse cancelEmployCandidate(JobApplicationDTO jobApplicationDTO);     //채용 취소

    ApiResponse changePassword(UserDTO userDTO);
}
