package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "jsp/business/business-dashboard";
    }

    @GetMapping("/profile")
    public String profileView(Model model)  {
        System.out.println("프로필");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }

        BusinessDashDTO businessProfile = businessDashService.getBusinessProfile();
        System.out.println("프로필 잘가져오기 있음. :"+ businessProfile);
        model.addAttribute("company", businessProfile);


        return "jsp/business/business-profile";
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
        return "jsp/business/business-changePassword";
    }

    //비밀번호 변경

    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView(Model model)  {
        System.out.println("공고관리");
        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }

        List<JobPostDTO> postJobList = businessDashService.postJobList();
        System.out.println("postJobList"+postJobList);
        model.addAttribute("postList", postJobList);

        return "jsp/business/business-managePostJob";
    }

    // 해당 공고에 지원한 지원자목록
    @GetMapping("/applicantList")
    public String applicantList (@RequestParam("jobId") int jobId, Model model) {
        System.out.println("jobId 확인 : "+ jobId);

        List<JobApplicationDTO> applicantList = businessDashService.applicantList(jobId);
        System.out.println("내가 작성한 "+jobId+"에 지원한 지원자들의 리스트 : "+applicantList);
        model.addAttribute("applicantList", applicantList);
        return "jsp/business/business-manageCandidate";
    }

    //지원자관리
    @GetMapping("/manageCandidate")
    public String manageCandidateView()  {
        System.out.println("지원자관리");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }
        return "jsp/business/business-manageCandidate";
    }

}
