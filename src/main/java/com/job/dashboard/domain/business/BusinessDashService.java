package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;

import java.util.List;
import java.util.Map;

public interface BusinessDashService {

    //저장
    Map<Object, Object> saveJob(JobPostDTO jobPostDTO, Integer userId);

    //목록
    List<JobPostDTO> jobList();

    //상세
    JobPostDTO detail(int id);

    //수정
    Map<Object, Object> update(int jobId, JobPostDTO jobPostDTO);
}
