package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
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
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }
        return "jsp/business/b-dashboard";
    }

    @GetMapping("/profile")
    public String profileView()  {
        System.out.println("프로필");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        return "jsp/business/b-profile";
    }

    @PostMapping("/profileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody BusinessDashDTO businessDashDTO) {
        System.out.println("====기업 프로필 저장====");
        System.out.println("입력한 정보 보기 : "+ businessDashDTO);

        Map<Object, String> map = businessDashService.saveProfile(businessDashDTO);
        System.out.println("map"+map);
        return map;
    }

    @GetMapping("/changePassword")
    public String changePasswordView()  {
        System.out.println("비번변경");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }
        return "jsp/business/b-changePassword";
    }
    @GetMapping("/manageCandidate")
    public String manageCandidateView()  {
        System.out.println("지원자관리");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }
        return "jsp/business/b-manageCandidate";
    }

    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView()  {
        System.out.println("공고관리");
        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }

//        List<JobPostDTO> PostList = businessDashService.postList();

        return "jsp/business/b-managePostJob";
    }
}
