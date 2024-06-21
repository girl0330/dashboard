package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface PersonalDashService {

    //프로필
    int profileCheck(int userNo); // 프로필 유무 확인
    UserProfileInfoDTO getProfile(Integer userNo); // 기존 프로필 가져오기
    Map<Object, String> saveProfile(UserProfileInfoDTO userProfileInfoDTO) throws IOException; // 새로운 프로필 저장

    // 비밀번호 변경하기
    Map<Object, Object> changePassword(UserDTO userDTO);

    //dashboard list -(지원한 공고)
    PageInfo<JobApplicationDTO> dashboardList(String keyword, int pageNum, int pageSize);

    // manageJobsList -(지원 현황)
    PageInfo<JobApplicationDTO> applyStatusList(String keyword, int pageNum, int pageSize);

    // 지원 리스트 삭제
    Map<String, Object> applyListDelete(int applicationId);

    // 좋아요 리스트
    PageInfo<JobPostDTO> likedJobsList(String keyword, int pageNum, int pageSize);


    // 지원 리스트 보기
//    JobPostDTO postDetailView(int jobId);

//    Map<String, Object> applyListLook(int applicationId);

}
