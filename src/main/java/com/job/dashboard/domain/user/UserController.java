package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final SessionUtil sessionUtil;

    //회원가입 페이지
    @GetMapping("/signup")
    public String signupView() {
        System.out.println("====회원가입 페이지====");
        return "jsp/register";
    }

    // 이메일 중복 검사
    @PostMapping("/emailDuplicateCheck")
    @ResponseBody
    public Map<String, Object> emailDuplicateCheck(@RequestBody UserDTO userDTO) {
        System.out.println("===email확인=== : "+userDTO);

        Map<String, Object> map = userService.emailDuplicateCheck(userDTO);
        System.out.println("넘어온 정보 확인" + map);
        return map;
    }

    //계정 등록
    @PostMapping("/signupInsert")
    @ResponseBody
    public Map<String, Object> signupInsert(@RequestBody UserDTO userDTO) {
        System.out.println("회원정보 저장하는 api ");
        System.out.println("회원가입 입력 정보확인 ::::  " + userDTO);
        Map<String, Object> map = userService.accountInsert(userDTO);
        System.out.println("넘어온 정보 확인" + map);
        return map;
    }

    //로그인 페이지
    @GetMapping("/login")
    public String loginView() {
        System.out.println("====로그인 페이지====");
        return "jsp/login";
    }

    //로그인
    @PostMapping("/doLogin")
    @ResponseBody
    public Map<String, Object> doLogin (@RequestBody UserDTO userDTO, Model model) {
        System.out.println("====회원 로그인===="+userDTO);

        Map<String, Object> map = userService.findAccount(userDTO);

        if (!"error".equals(map.get("code"))) {
            sessionUtil.loginUser((UserDTO) map.get("account"));
        }

        System.out.println("??????????? "+map.get("account"));

        model.addAttribute("loginUser", map.get("account"));
        return map;
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        System.out.println("====로그아웃====");
        // 세션 제거
        sessionUtil.logoutUser();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/login";
    }
}
