package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.ImagesDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import org.apache.ibatis.annotations.Mapper;

import java.io.IOException;
import java.util.List;

@Mapper
public interface BusinessDashMapper {

    // 기업 프로필 작성
    void savaProfile(CompanyInfoDTO companyInfoDTO);

    // 작성된 프로필 리스트로 가져오기
    List<CompanyInfoDTO> checkBusinessProfile(int userNo);

    // profileId 증가 쿼리
    int getCompanyIdSeq(int userNo);

    // profile 작성, 수정
    void saveBusinessProfile(CompanyInfoDTO companyInfoDTO);

    // 프로필 dto로 가져오기
    CompanyInfoDTO getBusinessProfile(int userNo);

    //keyword없는 작성공고 리스트
    List<JobPostDTO> postJobList(int userNo);

    //keyword있는 작성공고 리스트
    List<JobPostDTO> keywordPostJobList(JobPostDTO jobPostDTO);

    //지원자들의 userNo가져오기
    List<JobApplicationDTO> getApplicants(int jobId);

    //지원자의 userNo로 지원자 정보 가져오기
//    List<JobApplicationDTO> getApplicantsList(JobApplicationDTO applicants);

    List<JobApplicationDTO> getApplicantsInfo(int userNo);

    //작성한 공고에 지원한 지원자 상세보기
    JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId);

    //채용
    void applyCandidate(JobApplicationDTO jobApplicationDTO);

    //채용 최소
    void applyCancelCandidate(JobApplicationDTO jobApplicationDTO);

    //이미지 저장
    void saveImage(ImagesDTO imagesDTO) throws IOException;
}
