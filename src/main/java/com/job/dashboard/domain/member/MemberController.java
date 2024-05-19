package com.job.dashboard.domain.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    // 회원가입
    @GetMapping("/signup")
    public String signupView() {
        System.out.println("====회원가입 페이지====");
        return "jsp/register";
    }
    // 개인 계정 등록
    @PostMapping("/signupInsert")
    @ResponseBody
    public Map<Object, Object> insert(@RequestBody MemberDTO memberDTO) {
        System.out.println("회원정보 저장하는 api ");
        System.out.println("dto 확인 ::::  "+memberDTO);
        Map<Object,Object> map = memberService.insert(memberDTO);
        System.out.println("넘어온 정보 확인" + map);
        return map;
    }
    //기업 계정 등록
    @PostMapping("/signupInsertB")
    public Map<Object, Object> insertC(@RequestBody MemberDTO memberDTO) {
        System.out.println("기업 회원 저장 api     "+memberDTO);
        Map<Object, Object> map = memberService.insertB(memberDTO);
        System.out.println("넘어온 정보 확인"+map);
        return map;
    }

    // 로그인
    @GetMapping("/login")
    public String loginView() {
        System.out.println("====로그인 화면====");
        return "jsp/login";
    }
    //개인 로그인
    @PostMapping("/personalMemberLogin")
    @ResponseBody
    public Map<Object,Object> personalMemberLogin (@RequestBody MemberDTO memberDTO, HttpSession session, Model model) {
        System.out.println("====회원가입 api===="+memberDTO);
        Map<Object, Object> map = memberService.personalLogin(memberDTO);
        System.out.println("map확인::: "+map); //info라는 이름으로 dto타입 persoanlInfo가 map에 저장됨.

        // session에 MemberDTO 객체 저장하기 전에 값 확인
        if (map.get("personalInfo") != null) {
            System.out.println("personalInfo 값::: " + map.get("info"));
            session.setAttribute("personalInfo", map.get("personalInfo"));
        } else {
            System.out.println("personalInfo 값이 null입니다.");
        }

        System.out.println("session?? " + session.getAttribute("personalInfo"));
        return map;
    }
    //기업 로그인
    @PostMapping("/businessMemberLogin")
    @ResponseBody
    public Map<Object,Object> businessMemberLogin (@RequestBody MemberDTO memberDTO, HttpSession session) {
        System.out.println("====회원가입 api===="+memberDTO);
        Map<Object, Object> map = memberService.businessLogin(memberDTO);
        System.out.println("map확인::: "+map);

        //session
        session.setAttribute("businessInfo",map.get("info"));
        return map;
    }

    // 로그아웃
    @GetMapping("/Logout")
    public String logout(HttpSession session) {
        // 세션 제거
        session.invalidate();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/login?logout=true";
    }

}
