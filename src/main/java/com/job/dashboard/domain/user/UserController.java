package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
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
        return userService.insertUser(userDTO);
    }

    //로그인 페이지
    @GetMapping("/login")
    public String loginView() {
        return "jsp/login";
    }

    //로그인
    @PostMapping("/doLogin")
    @ResponseBody
    public Map<String, Object> doLogin (@RequestBody UserDTO userDTO) {

        Map<String, Object> map = userService.doLogin(userDTO);

        if (!"error".equals(map.get("code"))) {
            sessionUtil.loginUser((UserDTO) map.get("userLoginInfo"));
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

    //비밀번호 재설정
    @GetMapping("/findPassword")
    public String findPasswordView() {
        return "jsp/user-findPassword";
    }

    //재설정- 이메일 확인
    @PostMapping("/checkEmail")
    @ResponseBody
    public Boolean getCheckEmail(@RequestBody UserDTO userDTO) {
        return userService.getCheckEmail(userDTO.getEmail());
    }

    //재설정- 이름, 폰번호 확인
    @PostMapping("/checkIdentity")
    @ResponseBody
    public Map<String, Object> checkIdntity(@RequestBody UserProfileInfoDTO userProfileInfoDTO, Model model) {
        System.out.println("이름, 폰번호, email 확인 ::::  "+userProfileInfoDTO.getName() + "/" +userProfileInfoDTO.getPhone()+ "/" +userProfileInfoDTO.getEmail());
        Map<String, Object> map = userService.getCheckIdentity(userProfileInfoDTO);

        System.out.println("randomString확인 ::::  "+map.get("randomString"));
        model.addAttribute("randomString", map.get("randomString"));
        return map;
    }

    //재설정- 비밀번호 재설정
    @PostMapping("/passwordReset")
    @ResponseBody
    public Map<String, Object> passwordReset(@RequestBody UserDTO userDTO) {
        System.out.println("넘어온 데이터 확인 ::::  "+userDTO);
        return userService.passwordReset(userDTO);
    }

}
