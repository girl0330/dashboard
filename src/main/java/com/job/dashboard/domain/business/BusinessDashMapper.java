package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BusinessDashMapper {

    //게시글 작성
    void saveJob(JobPostDTO jobPostDTO);

    //게시글 목록
    List<JobPostDTO> getJobLists();

    //게시글 상세페이지
    JobPostDTO getJobDetail(int id);

    void updateJob(JobPostDTO jobPostDTO);

    // 작성한 userId가져오기
    Integer getWriteUserId(int jobId);

    void delete(int jobId);

    // 로그인 회원의 프로필 유무확인
     PersonalDashDTO profileCheck(PersonalDashDTO personalDashDTO);

    // 지원하기
    String application(JobApplicationDTO jobApplicationDTO);

    //회원 프로필 확인
    int profileCount(int userId);

    //중복 지원 체크
    int applyCheck(JobApplicationDTO jobApplicationDTO);

    //공고 지원하기
    void insertJobApplicationInfo(JobApplicationDTO jobApplicationDTO);


//    void delete(int jobId);

    //게시글 수정
}
