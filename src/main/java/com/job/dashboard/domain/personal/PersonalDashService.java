package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface PersonalDashService {

    //프로필이 작성 유무
    Boolean profileCheck(Integer userNo);

    // 기존 작성된 프로필 가져오기
    PersonalDashDTO getProfile(Integer userNo);

    // 프로필 저장하기
    Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO);

    // 비밀번호 변경하기
    Map<Object, Object> changePassword(UserDTO userDTO);

    // 지원 현황리스트
    List<JobApplicationDTO> applyList();
    // 지원 리스트 삭제
    Map<String, Object> applyListDelete(int applicationId);

    // 지원한 목록리스트
    List<JobApplicationDTO> applyJobList(Integer userNo);
    // 지원 리스트 보기
//    JobPostDTO postDetailView(int jobId);

//    Map<String, Object> applyListLook(int applicationId);

    // 비밀번호 업데이트
}
