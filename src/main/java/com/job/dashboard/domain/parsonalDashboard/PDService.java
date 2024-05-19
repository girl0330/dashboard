package com.job.dashboard.domain.parsonalDashboard;

import com.job.dashboard.domain.member.MemberDTO;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface PDService {
    Map<Object, Object> saveProfile(Long uuid);
}
