package com.job.dashboard.domain.kakao;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class KakaoController {
    private final KakaoService kakaoService;

    @Value("${kakao.auth-url}")
    private String kakaoAuthUrl;

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

//카카오 로그인 화면 노출
    @GetMapping("/kakao/login")
    public String kakaoLoginView() {
        System.out.println("카카오 로그인 01");
        return "redirect:" + kakaoAuthUrl + "?client_id=" + clientId + "&redirect_uri=" + redirectUri + "&response_type=code";
    }

    @GetMapping("/user/kakao/login")
    public ModelAndView kakaoCallback(@RequestParam String code) {
        System.out.println("카카오 로그인 02" + code);
        return kakaoService.handleKakaoLogin(code);
    }

}
