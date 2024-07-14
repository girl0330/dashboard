package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface PostService {

    //저장
    Map<String, Object> insertPost(JobPostDTO jobPostDTO);

    //목록
    PageInfo<JobPostDTO> jobList(String keyword, int pageNum, int pageSize);

    //like
    int findLike(Map<String, Object> map);
    //좋아요 관리
    Map<String, Object> likeControl(int jobId, HttpServletRequest request);

    //상세
    JobPostDTO getJobPostDetailInfo(int jobId);

    //수정
    Map<String, Object> updateJobPost(int userNo, JobPostDTO jobPostDTO);

//    void deleteJobPost(int jobId, Integer userNo);

    //삭제
    void deleteJobPost(int jobId);

    //공고 지원
    Map<String,Object> applyJobPost(JobApplicationDTO jobApplicationDTO);

    //지원 취소하기
    Map<String, Object> applyCancelJob(Integer jobId);

    int getCountJobs();

    //likeList
    List<LikeDTO> getLikeList();

    // 프로필 존재 확인
    int profileCheck(int userNo);

    // 유저 지원상태 가져오기
    JobApplicationDTO getUserStatusCode(Map<String, Object> map);

    // 지원 상태 int로 가져오기
    int getCountUserStatusCode(Map<String, Object> map);

    // 중복 지원 확인
    Map<String, Object> checkDuplicateApply(JobApplicationDTO jobApplicationDTO);

    // 리스트에 보내줄 파일 가져오기
//    int getFile();
}
