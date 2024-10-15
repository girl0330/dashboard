package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserInfoDTO;

public interface UserService {
    ApiResponse insertUser(UserDTO userDTO);

    ApiResponse doLogin(UserDTO userDTO);

    // 이메일 중복인지 확인
    ApiResponse checkEmailDuplication(UserDTO userDTO);

    ApiResponse getCheckEmail(UserDTO userDTO);

    ApiResponse getCheckIdentity(UserInfoDTO userInfoDTO);

    ApiResponse passwordReset(UserDTO userDTO);

    //이용약관 가져오기
    TermsInfoDTO getTermsTypeCode(int termsTypeCode);

}
