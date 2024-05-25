package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface PersonalDashService {
    Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO, HttpSession session);

    PersonalDashDTO getProfile(Integer userId);

    Boolean profileCheck(Integer userId);
}
