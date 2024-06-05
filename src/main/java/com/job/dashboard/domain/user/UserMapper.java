package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {
    // 이메일 중복인가 확인
    int check(UserDTO userDTO);

    //계정 등록(회원가입    )
    void accountInsert(UserDTO userDTO);

    // 입력되어있던 해시코드 비밀번호 가져오기(로그인)
    String getHashedPassword(String email);

    //저장되어 있는 계정 가져오기 (로그인)
    UserDTO findAccount(UserDTO userDTO);
}
