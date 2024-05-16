package com.job.dashboard.domain.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")

public class MemberController {
    @GetMapping("/signup")
    public String signupView() {
        System.out.println("====회원가입 페이지====");
        return "jsp/register";
    }
}
