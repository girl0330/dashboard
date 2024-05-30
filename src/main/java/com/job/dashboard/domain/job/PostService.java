package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.JobPostDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface PostService {

    //저장
    Map<Object, Object> saveJob(JobPostDTO jobPostDTO, Integer userNo);

    //목록
    List<JobPostDTO> jobList();

    //상세
    JobPostDTO detail(int id);

    //수정
    Map<Object, Object> update(int userNo, JobPostDTO jobPostDTO);

//    void delete(int jobId, Integer userNo);

    //삭제
    Map<Object, Object> delete(int jobId, Integer userNo);

    Map<String,Object> applyJob(Integer jobId, HttpSession session);
}
