package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {

    //작성
    void saveJob(JobPostDTO jobPostDTO);

    //목록
    List<JobPostDTO> getJobLists(String keyword);

    //상세페이지
    JobPostDTO getJobDetail(int jobId);

    //수정
    void updateJob(JobPostDTO jobPostDTO);

    //삭제
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

    //총 게시물
    int getCountJobs ();

    // 작성한 userNo
    Integer getWriteUserNo(int jobId);


    //like
    int findLike(Map<String, Object> map); //like 있는지 확인
    void likeUp(Map<String, Object> map); //like 증가
    void deleteLike(Map<String, Object> map); //like 삭제
    List<LikeDTO> getLikeList(int userNo); //like 리스트 가져오기

}
