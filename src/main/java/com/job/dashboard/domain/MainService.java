package com.job.dashboard.domain;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.CountDataDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;

import java.util.List;

public interface MainService {
    List<JobPostDTO> getLikeListUp();

    List<JobPostDTO> getRecentListUp();

    ApiResponse getNumberCount();
}
