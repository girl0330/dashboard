package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface BusinessDashService {

    //기업 프로필 작성/수정
    Map<Object, String> saveProfile(CompanyInfoDTO companyInfoDTO);

    //기업 프로필 가져오기
    CompanyInfoDTO getBusinessProfile();

    //기업 검색한 작성공고 리스트
    List<JobPostDTO> keywordPostJobList(String keyword);

    //기업 작성한 공고 리스트
    List<JobPostDTO> postJobList();

    //작성한 공고에 지원한 지원자 리스트
    List<JobApplicationDTO> applicantList(int jobId);

    //작성한 공고에 지원한 지원자 상세보기
    JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId);

    //직원 채용
    Map<Object, String> applyCandidate(JobApplicationDTO jobApplicationDTO);

    //채용 취소
    Map<Object, String> applyCancelCandidate(JobApplicationDTO jobApplicationDTO);

    //파일 저장
    Map<Object, String> saveFile(MultipartFile file) throws IOException;
    byte[] loadFileAsBytes(String savedName) throws IOException;

}
