package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonalDashMapper {

    List<PersonalDTO> checkProfile(int userId);
    int getProfileIdSeq(int userId);

    PersonalDTO saveProfile(PersonalDTO personalDTO);

    PersonalDTO getProfile(int userId);
}
