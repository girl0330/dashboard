package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;

import java.util.Map;

public interface UserService {
    Map<Object, Object> accountInsert(UserDTO userDTO);

    Map<Object, Object> findAccount(UserDTO userDTO);
}
