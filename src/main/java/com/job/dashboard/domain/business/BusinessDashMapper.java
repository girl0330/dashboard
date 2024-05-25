package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessDashMapper {
    void saveJob(JobPostDTO jobPostDTO);
}
