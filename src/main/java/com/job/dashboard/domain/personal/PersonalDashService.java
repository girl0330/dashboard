package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.*;

import java.io.IOException;
import java.util.Map;

public interface PersonalDashService {

    //프로필
    int profileCountByUserNo(int userNo);
    UserProfileInfoDTO getProfileInfo(int userNo); // 프로필 체크
    Map<Object, String> insertProfile(UserProfileInfoDTO userProfileInfoDTO) throws IOException; // 새로운 프로필 저장

    // 비밀번호 변경하기
    Map<Object, Object> changePassword(UserDTO userDTO);

    //dashboard list -(지원한 공고)
    PageInfo<JobApplicationDTO> getDashboardList(String keyword, int pageNum, int pageSize);

    // manageJobsList -(지원 현황)
    PageInfo<JobApplicationDTO> applyStatusList(String keyword, int pageNum, int pageSize);

    // 좋아요 리스트
    PageInfo<JobPostDTO> likedJobsList(String keyword, int pageNum, int pageSize);


}
