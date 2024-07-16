package com.job.dashboard.domain;

import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;

import java.util.List;

public interface MainService {
    List<JobPostDTO> getLikeListUp();

    List<JobPostDTO> getRecentListUp();
}
