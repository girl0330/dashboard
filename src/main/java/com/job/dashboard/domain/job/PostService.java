package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface PostService {

    //저장
    ApiResponse insertPost(JobPostDTO jobPostDTO);

    //목록
    PageInfo<JobPostDTO> jobList(String keyword, int pageNum, int pageSize);

    //like
    int findLike(JobPostDTO jobPostDTO);
    //좋아요 관리
    ApiResponse likeControl(int jobId);

    //상세
    JobPostDTO getJobPostDetailInfo(int jobId);

    //수정
    ApiResponse updateJobPost(JobPostDTO jobPostDTO);

    //삭제
    void deleteJobPost(int jobId);

    //공고 지원
    ApiResponse applyJobPost(JobApplicationDTO jobApplicationDTO);

    //지원 취소하기
    ApiResponse applyCancelJob(int jobId);

    //likeList
    List<LikeDTO> getLikeList();

    // 프로필 존재 확인
    int profileCheck(int userNo);

    // 지원 상태 int로 가져오기
    int getCountUserStatusCode(JobPostDTO jobPostDTO);

    // 중복 지원 확인
    ApiResponse checkDuplicateApply(JobApplicationDTO jobApplicationDTO);

    // 리스트에 보내줄 파일 가져오기
//    int getFile();

    // 유저 지원상태 가져오기
//    JobApplicationDTO getUserStatusCode(Map<String, Object> map);

//    int getCountJobs();

//    void deleteJobPost(int jobId, Integer userNo);
}
