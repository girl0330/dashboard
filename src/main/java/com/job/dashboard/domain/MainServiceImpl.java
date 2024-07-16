package com.job.dashboard.domain;

import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
    private final MainMapper mainMapper;

    public List<JobPostDTO> getLikeListUp() {
        return mainMapper.getLikeListUp();
    }

    public List<JobPostDTO> getRecentListUp() {
        return mainMapper.getRecentListUp();
    }

}
