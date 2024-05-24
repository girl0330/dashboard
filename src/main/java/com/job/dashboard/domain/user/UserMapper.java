package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {
    int check(UserDTO userDTO);

    void accountInsert(UserDTO userDTO);


    String getHashedPassword(String email);

    UserDTO findAccount(UserDTO userDTO);
}
