package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BusinessDashMapper {

    // 기업 프로필 작성
    void savaProfile(BusinessDashDTO businessDashDTO);

    // 작성된 프로필 리스트로 가져오기
    List<BusinessDashDTO> checkBusinessProfile(int userNo);

    // profileId 증가 쿼리
    int getCompanyIdSeq(int userNo);

    // profile 작성, 수정
    void saveBusinessProfile(BusinessDashDTO businessDashDTO);

    // 프로필 dto로 가져오기
    BusinessDashDTO getBusinessProfile(int userNo);

    List<JobPostDTO> postJobList(int userNo);

    //지원자들의 userNo가져오기
    List<JobApplicationDTO> getApplicants(int jobId);

    //지원자의 userNo로 지원자 정보 가져오기
//    List<JobApplicationDTO> getApplicantsList(JobApplicationDTO applicants);

    List<JobApplicationDTO> getApplicantsInfo(int userNo);

    //작성한 공고에 지원한 지원자 상세보기
    JobApplicationDTO getCandidateApplyDetail(int userNo);

}
