package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PersonalDashMapper {

    // 프로필
    UserInfoDTO getProfileInfo(int userNo); // 기존 작성된 프로필 가져오기
    List<UserInfoDTO> profileInfoList(int userNo); // 저장된 프로필 있으면 가져오기
    int getProfileIdSeq(int userNo); //프로필 pk
    void insertProfile(UserInfoDTO userInfoDTO); //새 프로필 저장

    // 비밀번호
    UserDTO getOldPassword(int userNo);
    void updatePassword(UserDTO userDTO);

    // 지원형황 리스트
    List<JobApplicationDTO> applyStatusList(Map<String, Object> map);

    //dashboard list
    List<JobApplicationDTO> getDashboardList(Map<String, Object> map);

//    int getCountJobs();

    //좋아요 리스트
    List<JobPostDTO> getLikeJobsList(Map<String, Object> map);

    // 프로필 가져오기
    int profileCountByUserNo(int userNo);
}
