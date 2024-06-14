package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.Criteria;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface PostService {

    //저장
    Map<String, Object> saveJob(JobPostDTO jobPostDTO);

    //목록
    List<JobPostDTO> jobList();

    //검색한 공고리스트
    List<JobPostDTO> keywordJobList(String keyword);

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

    //페이징 처리
    List<JobPostDTO> getListWithPaging(Criteria criteria);

    int getCountJobs();

    //총 게시물
}
