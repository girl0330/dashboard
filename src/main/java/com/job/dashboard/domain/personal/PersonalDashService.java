package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDTO;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface PersonalDashService {
    Map<Object, Object> saveProfile(PersonalDTO personalDTO, HttpSession session);

    PersonalDTO getProfile(Integer userId);
}
