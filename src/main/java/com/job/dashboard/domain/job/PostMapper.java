package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.Criteria;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {

    //게시글 작성
    void saveJob(JobPostDTO jobPostDTO);

    //게시글 목록
    List<JobPostDTO> getJobLists(String keyword);

    //검색한 공고 리스트
    List<JobPostDTO> getKeywordList(Criteria criteria);

    //게시글 상세페이지
    JobPostDTO getJobDetail(int jobId);

    void updateJob(JobPostDTO jobPostDTO);

    // 작성한 userNo
    Integer getWriteUserNo(int jobId);

    void delete(int jobId);

    // 로그인 회원의 프로필 유무확인
     UserProfileInfoDTO profileCheck(UserProfileInfoDTO userProfileInfoDTO);

    // 지원하기
    String application(JobApplicationDTO jobApplicationDTO);

    //회원 프로필 확인
    int profileCount(int userNo);

    //중복 지원 체크
    int applyCheck(JobApplicationDTO jobApplicationDTO);

    //공고 지원하기
    void insertJobApplicationInfo(JobApplicationDTO jobApplicationDTO);
    //공고 지원 취소하기
    void deleteJobApplicationInfo(JobApplicationDTO jobApplicationDTO);


    //프로필 작성 체크
    int profileExistCheck(int userNo);

    //userNo의 지원 정보확인
    int applicationUserChe(int userNo);

    // 페이징 처리
    List<JobPostDTO> getListWithPaging(Criteria criteria);

    //총 게시물
    int getCountJobs ();

    //게시글 수정
}
