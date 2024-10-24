package com.job.dashboard.domain;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.CountDataDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
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

    public ApiResponse getNumberCount() {
        CountDataDTO countDataDTO = mainMapper.getNumberCount();

        return ApiResponse.builder()
                .code(200)
                .message("countData 전송 성공")
                .data(countDataDTO)
                .build();
    }
}
