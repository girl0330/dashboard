package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonalDashMapper {

    // 프로필 작성 확인
    int profileCheck(int userId);

    // 기존 작성된 프로필 가져오기
    PersonalDashDTO getProfile(int userId);

    // 저장된 프로필 있으면 가져오기
    List<PersonalDashDTO> checkProfile(int userId);
    int getProfileIdSeq(int userId);

    void saveProfile(PersonalDashDTO personalDashDTO);

    // 비밀번호
    UserDTO getOldPassword(int userId);

    void updatePassword(UserDTO userDTO);
}