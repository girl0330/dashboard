package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BusinessDashController {
    private final BusinessDashService businessDashService;
    private final SessionUtil sessionUtil;

    @GetMapping("/dashboard")
    public String dashboardView()  {
        System.out.println("대시보드");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동"); // 로그인 정보가 없으면 "로그인후 이용 가능합니다."라는 message를 보여주고싶음
            return "redirect:/user/login?test=true";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }
        return "jsp/business/b-dashboard";
    }

    @GetMapping("/profile")
    public String profileView(HttpSession session)  {
        System.out.println("프로필");

        Integer userNo = (Integer) session.getAttribute("userNo");
        if (userNo == null) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }
        return "jsp/business/b-profile";
    }
    @GetMapping("/changePassword")
    public String changePasswordView(HttpSession session)  {
        System.out.println("비번변경");

        Integer userNo = (Integer) session.getAttribute("userNo");
        if (userNo == null) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }
        return "jsp/business/b-changePassword";
    }
    @GetMapping("/manageCandidate")
    public String manageCandidateView(HttpSession session)  {
        System.out.println("지원자관리");

        Integer userNo = (Integer) session.getAttribute("userNo");
        if (userNo == null) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }
        return "jsp/business/b-manageCandidate";
    }

    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView(HttpSession session)  {
        System.out.println("공고관리");
        Integer userNo = (Integer) session.getAttribute("userNo");
        if (userNo == null) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }

        String userTypeCode = (String) session.getAttribute("userTypeCode");
        System.out.println("userTypeCode " +  userTypeCode);
        if (!Objects.equals(userTypeCode, "20")) {
            return "redirect:/";
        }

        List<JobPostDTO> PostList = businessDashService.PostList(userNo);
        return "jsp/business/b-managePostJob";
    }
}
