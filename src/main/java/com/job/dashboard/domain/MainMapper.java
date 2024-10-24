package com.job.dashboard.domain;

import com.job.dashboard.domain.dto.CountDataDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {
    List<JobPostDTO> getLikeListUp();

    List<JobPostDTO> getRecentListUp();

    CountDataDTO getNumberCount();
}
