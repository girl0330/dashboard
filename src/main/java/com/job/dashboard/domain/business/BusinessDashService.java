package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;

import java.util.Map;

public interface BusinessDashService {
    Map<Object, Object> saveJob(JobPostDTO jobPostDTO);
}
