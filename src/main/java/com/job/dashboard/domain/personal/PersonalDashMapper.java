package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PersonalDashMapper {

    // 프로필 작성 확인
    int profileCheck(int userNo);

    // 기존 작성된 프로필 가져오기
    UserProfileInfoDTO getProfile(int userNo);

    // 저장된 프로필 있으면 가져오기
    List<UserProfileInfoDTO> checkProfile(int userNo);
    int getProfileIdSeq(int userNo);
    void saveProfile(UserProfileInfoDTO userProfileInfoDTO);

    // 비밀번호
    UserDTO getOldPassword(int userNo);
    void updatePassword(UserDTO userDTO);

    // 현재 지원형황 리스트
    List<JobApplicationDTO> applyStatusList(Map<String, Object> map);

    // 지원한 공고 삭제
    void applyListCancel(int applicationId);

    //dashboard list
    List<JobApplicationDTO> applyJobList(Map<String, Object> map);

    int getCountJobs();


}
