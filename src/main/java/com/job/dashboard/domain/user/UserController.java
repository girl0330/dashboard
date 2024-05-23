package com.job.dashboard.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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


}
