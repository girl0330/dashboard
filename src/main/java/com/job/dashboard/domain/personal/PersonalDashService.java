package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface PersonalDashService {

    //프로필이 작성 유무
    Boolean profileCheck(Integer userId);

    // 기존 작성된 프로필 가져오기
    PersonalDashDTO getProfile(Integer userId);

    // 프로필 저장하기
    Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO, HttpSession session);

    // 비밀번호 변경하기
    Map<Object, Object> changePassword(UserDTO userDTO);

    // 비밀번호 업데이트
}
