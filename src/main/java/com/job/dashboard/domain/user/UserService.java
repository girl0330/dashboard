package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;

import java.util.Map;

public interface UserService {
    Map<String, Object> accountInsert(UserDTO userDTO);

    Map<String, Object> findAccount(UserDTO userDTO);

    // 이메일 중복인지 확인
    Map<String, Object> emailDuplicateCheck(UserDTO userDTO);
}
