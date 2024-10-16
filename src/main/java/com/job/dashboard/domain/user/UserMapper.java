package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    //계정 등록(회원가입    )
    void insertUser(UserDTO userDTO);

    // 입력되어있던 해시코드 비밀번호 가져오기(로그인)
    String getHashedPassword(String email);

    //저장되어 있는 계정 가져오기 (로그인)
    UserDTO getLoginUserInfo(UserDTO userDTO);

    //타입코드 가져오기
    String getUserTypeCode(String email);

    //email 확인
    int getCheckEmail(String email);

    //이름, 핸드폰
    int getCheckIdentity(UserInfoDTO userInfoDTO);


    void updatePassword(UserDTO userDTO);

    TermsInfoDTO getTermsTypeCode(int termsTypeCode);
}
