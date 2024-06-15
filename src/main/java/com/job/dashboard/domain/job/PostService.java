package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;

import java.util.List;
import java.util.Map;

public interface PostService {

    //저장
    Map<String, Object> saveJob(JobPostDTO jobPostDTO);

    //목록
    PageInfo<JobPostDTO> jobList(String keyword, int pageNum, int pageSize);

    //상세
    JobPostDTO detail(int jobId);

    //수정
    Map<String, Object> update(int userNo, JobPostDTO jobPostDTO);

//    void delete(int jobId, Integer userNo);

    //삭제
    void delete(int jobId);

    //공고 지원
    Map<String,Object> applyJob(JobApplicationDTO jobApplicationDTO);

    //지원 취소하기
    Map<String, Object> applyCancelJob(Integer jobId);

    int getCountJobs();

    //총 게시물
}
