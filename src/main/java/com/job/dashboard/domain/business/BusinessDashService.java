package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;

import java.util.List;
import java.util.Map;

public interface BusinessDashService {

    //기업 프로필 작성
    Map<Object, String> saveProfile(BusinessDashDTO businessDashDTO);

    //기업 프로필 가져오기
    BusinessDashDTO getBusinessProfile();

    //기업 작성한 공고 리스트
    List<JobPostDTO> postJobList();

    //작성한 공고 리스트에 지원한 지원자 리스트
    List<JobApplicationDTO> applicantList(int jobId);
}
