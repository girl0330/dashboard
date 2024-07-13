package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;

import java.util.Map;

public interface UserService {
    Map<String, Object> insertUser(UserDTO userDTO);

    Map<String, Object> doLogin(UserDTO userDTO);

    // 이메일 중복인지 확인
    Map<String, Object> emailDuplicateCheck(UserDTO userDTO);

    Boolean getCheckEmail(String email);

    Map<String, Object> getCheckIdentity(UserProfileInfoDTO userProfileInfoDTO);

    Map<String, Object> passwordReset(UserDTO userDTO);

    //이용약관 가져오기
    TermsInfoDTO getTermsTypeCode(int termsTypeCode);


}
