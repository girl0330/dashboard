package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface BusinessDashService {

    //저장
    Map<Object, Object> saveJob(JobPostDTO jobPostDTO, Integer userId);

    //목록
    List<JobPostDTO> jobList();

    //상세
    JobPostDTO detail(int id);

    //수정
    Map<Object, Object> update(int userId, JobPostDTO jobPostDTO);

//    void delete(int jobId, Integer userId);

    //삭제
    Map<Object, Object> delete(int jobId, Integer userId);

    Map<String,Object> applyJob(int jobId, HttpSession session);
}
