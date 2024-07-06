package com.job.dashboard.domain.kakao;

import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface KakaoMapper {
    Optional<UserDTO> getUserInfo(String kakaoUserId);
}
