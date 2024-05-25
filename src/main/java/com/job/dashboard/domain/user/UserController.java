package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    //회원가입 페이지 이동
    @GetMapping("/signup")
    public String signupView() {
        System.out.println("====회원가입 페이지====");
        return "jsp/register";
    }

    //계정 등록
    @PostMapping("/signupInsert")
    @ResponseBody
    public Map<Object, Object> insert(@RequestBody UserDTO userDTO) {
        System.out.println("회원정보 저장하는 api ");
        System.out.println("회원가입 입력 정보확인 ::::  " + userDTO);
        Map<Object, Object> map = userService.accountInsert(userDTO);
        System.out.println("넘어온 정보 확인" + map);
        return map;
    }

    //로그인 페이지 이동
    @GetMapping("/login")
    public String loginView() {
        System.out.println("====로그인 페이지====");
        return "jsp/login";
    }

    @PostMapping("/doLogin")
    @ResponseBody
    public Map<Object, Object> accountLogin (@RequestBody UserDTO userDTO, HttpSession session) {
        System.out.println("====회원 로그인===="+userDTO);
        Map<Object, Object> map = userService.findAccount(userDTO);
        if (map.get("code") == "error") {
            return map;
        }
        UserDTO userId = (UserDTO) map.get("account");
        session.setAttribute("userId", userId.getUserId());// userId만 가져와서 session에 넣기
        session.setAttribute("userEmail", userId.getEmail());
        session.setAttribute("userTypeCode", userId.getUserTypeCode());
        return map;
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        System.out.println("====로그아웃====");
        // 세션 제거
        session.invalidate();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/login?logout=true";
    }
}
