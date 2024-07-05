package com.job.dashboard.domain.kakao;

import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KakaoMapper {
    int getUserEmailCoun(UserDTO kakaoUser);

    UserDTO getUserInfo(UserDTO kakaoUser);
}
