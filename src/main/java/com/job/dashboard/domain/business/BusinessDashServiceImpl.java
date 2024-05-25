package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;

    // 구인 공고 저장
    public Map<Object, Object> saveJob(JobPostDTO jobPostDTO) {
        System.out.println("====저장 임플=====");
        Map<Object, Object> map = new HashMap<>();

        businessDashMapper.saveJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }
}
