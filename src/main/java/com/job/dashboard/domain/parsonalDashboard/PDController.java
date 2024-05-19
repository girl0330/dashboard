package com.job.dashboard.domain.parsonalDashboard;

import com.job.dashboard.domain.member.MemberDTO;
import com.mysql.cj.log.Log;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PDController {
    private final PDService pdService;

    @GetMapping("/dashboard")
    public String dashboardView(HttpSession session, Model model) {
//
        System.out.println("====개인 게시판====");
//        MemberDTO personalInfo = (MemberDTO) session.getAttribute("personalInfo");
//        System.out.println("personalInfo??? " + personalInfo);
//
//        // 모델에 추가하여 JSP에서 사용 가능하게 설정
//        if (personalInfo != null) {
//            model.addAttribute("personalInfo", personalInfo);
//        } else {
//            System.out.println("세션에 personalInfo 값이 없습니다.");
//        }

        return "jsp/personal/p-dashboard";
    }

    @GetMapping("/myProfile")
    public String profileView(HttpSession session) {
        System.out.println("====개인 프로필====");
        Object personalInfo = session.getAttribute("personalInfo");
        System.out.println("personalInfo"+personalInfo);
        if (personalInfo == null) {
            return "redirect:/member/login";
        }
//        System.out.println("memberUuid"+memberUuid);
        return "jsp/personal/p-profile";
    }

    @PostMapping("/myProfile")
    public String profile(@RequestParam("uuid") Long uuid, PDDTO pddto) {
        System.out.println("====개인 프로필 실행====");
        System.out.println("uuid"+ uuid);
        Map<Object, Object> memberDetail = pdService.saveProfile(uuid);
//        System.out.println("pddto????"+pddto);
//        Map<Object, Object> map = pdService.saveProfile(pddto);
//        System.out.println("map??"+map);

        return "null";
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
