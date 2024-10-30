package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.*;

import java.io.IOException;
import java.util.Map;

public interface PersonalDashService {

    //프로필
    int profileCountByUserNo(int userNo);
    UserInfoDTO getProfileInfo(int userNo); // 프로필 체크
    ApiResponse insertProfile(UserInfoDTO userInfoDTO) throws IOException; // 새로운 프로필 저장

    // 비밀번호 변경하기
    ApiResponse changePassword(UserDTO userDTO);

    // manageJobsList -(지원 현황)
    PageInfo<JobApplicationDTO> applyStatusList(String keyword, int pageNum, int pageSize);

    // 좋아요 리스트
    PageInfo<JobPostDTO> likedJobsList(String keyword, int pageNum, int pageSize);


}
