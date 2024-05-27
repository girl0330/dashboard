package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;

    // 구인 공고 저장
    public Map<Object, Object> saveJob(JobPostDTO jobPostDTO, Integer userId) {
        System.out.println("====저장 임플=====");
        Map<Object, Object> map = new HashMap<>();

        jobPostDTO.setUserId(userId);
        System.out.println("dto 확인하기 : "+ jobPostDTO);

        businessDashMapper.saveJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 목록
    public List<JobPostDTO> jobList() {
        System.out.println("====공고리스트 impl입니다.====");
        return businessDashMapper.getJobLists();
    }

    // 구인 공고 상세페이지
    public JobPostDTO detail(int id) {
        System.out.println("====상세페이지 impl 입니다. ====");
        return businessDashMapper.getJobDetail(id);
    }

    // 구인 공고 수정
    public Map<Object, Object> update(int jobId, JobPostDTO jobPostDTO) {
        Map<Object, Object> map = new HashMap<>();
        businessDashMapper.updateJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }
}
