package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;

import java.util.List;
import java.util.Map;

public interface PersonalDashService {

    //프로필이 작성 유무
    int profileCheck(int userNo);

    // 기존 작성된 프로필 가져오기
    UserProfileInfoDTO getProfile(Integer userNo);

    // 프로필 저장하기
    Map<Object, String> saveProfile(UserProfileInfoDTO userProfileInfoDTO);

    // 비밀번호 변경하기
    Map<Object, Object> changePassword(UserDTO userDTO);

    //현재지원 현황리스트
    List<JobApplicationDTO> currentApplyList();
    // 지원 리스트 삭제
    Map<String, Object> applyListDelete(int applicationId);

    //최근 지원한 공고 목록 리스트
    List<JobApplicationDTO> recentlyApplyJobList(int userNo);
    // 지원 리스트 보기
//    JobPostDTO postDetailView(int jobId);

//    Map<String, Object> applyListLook(int applicationId);

    // 비밀번호 업데이트
}
