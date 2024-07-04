package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final SessionUtil sessionUtil;
//    private final KakaoApi kakaoApi;

    //회원가입 페이지
    @GetMapping("/signup")
    public String signupView() {
        return "jsp/register";
    }

    // 이메일 중복 검사
    @PostMapping("/emailDuplicateCheck")
    @ResponseBody
    public Map<String, Object> emailDuplicateCheck(@RequestBody UserDTO userDTO) {

        return userService.emailDuplicateCheck(userDTO);
    }

    //계정 등록
    @PostMapping("/insertSignUp")
    @ResponseBody
    public Map<String, Object> insertSignUp(@RequestBody UserDTO userDTO) {
        return userService. insertUser(userDTO);
    }

    //로그인 페이지
    @GetMapping("/login")
    public String loginView() {
        return "jsp/login";
    }

    //로그인
    @PostMapping("/doLogin")
    @ResponseBody
    public Map<String, Object> doLogin (@RequestBody UserDTO userDTO, Model model) {

        Map<String, Object> map = userService.doLogin(userDTO);

        if (!"error".equals(map.get("code"))) {
            sessionUtil.loginUser((UserDTO) map.get("account"));
        }
        return map;
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        // 세션 제거
        sessionUtil.logoutUser();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/login";
    }

    //카톡 로그인
//    @GetMapping("/login/kakao")
//    public String kakaoLogin(@RequestParam String code) {
//        //인가 코드 받기 (@RequestParam String code)
//
//        //2. 토큰 받기
//        String accessToken = kakaoApi.getAccessToken(code);
//
//        //3. 사용자 정보
//        Map<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);
//        String nickname = (String)userInfo.get("email");
//
//        System.out.println("nickname ::::::   "+nickname);
//        System.out.println("accessToken :::::::  "+accessToken);
//
//        return "redirect:/login";
//    }
}
