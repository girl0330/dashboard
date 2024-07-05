package com.job.dashboard.domain.kakao;

import com.job.dashboard.domain.dto.UserDTO;
import org.springframework.web.servlet.ModelAndView;

public interface KakaoService {
    ModelAndView handleKakaoLogin(String code);
}
