package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonalDashMapper {

    int profileCheck(int userId);

    List<PersonalDashDTO> checkProfile(int userId);
    int getProfileIdSeq(int userId);

    void saveProfile(PersonalDashDTO personalDashDTO);

    PersonalDashDTO getProfile(int userId);
}
