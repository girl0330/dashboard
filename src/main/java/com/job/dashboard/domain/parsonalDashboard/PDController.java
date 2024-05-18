package com.job.dashboard.domain.parsonalDashboard;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PDController {
    private final PDService pdService;

    @GetMapping("/dashboard")
    public String dashboardView() {
        System.out.println("====개인 게시판====");
        return "jsp/personal/p-dashboard";
    }

    @GetMapping("/myProfile")
    public String profileView() {
        System.out.println("====개인 프로필====");
        return "jsp/personal/p-profile";
    }

    @GetMapping("/changePassword")
    public String changePasswordView(){
        System.out.println("====개인 비번 변경====");
        return "jsp/personal/p-changePassword";
    }

    @GetMapping("/myResume")
    public String myResumeView(){
        System.out.println("====개인 이력서====");
        return "jsp/personal/p-myResume";
    }

    @GetMapping("/manageJobs")
    public String manageJobsView(){
        System.out.println("====개인 매니지잡스====");
        return "jsp/personal/p-manageJobs";
    }

    @GetMapping("/savedJobs")
    public String savedJobsView(){
        System.out.println("====개인 세이브잡스====");
        return "jsp/personal/p-savedJobs";
    }

    @GetMapping("/pricingPlan")
    public String pricingPlanView(){
        System.out.println("====개인 프린시핑플랜====");
        return "jsp/personal/p-pricingPlan";
    }
}
