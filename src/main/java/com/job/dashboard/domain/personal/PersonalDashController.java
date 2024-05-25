package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PersonalDashController {
    private final PersonalDashService personalDashService;

    @GetMapping("/dashboard")
    public String dashboardView(HttpSession session, Model model)  {
        System.out.println("==== 개인 회원 대시보드====");
        Integer userId = (Integer) session.getAttribute("userId");
        String userTypeCode = (String) session.getAttribute("userTypeCode");
        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println("userEmail;;;;::    " + userEmail);
        System.out.println("userId::::;     " + userId);
            if (userId == null) {
                return "redirect:/user/login";
            }

        Boolean profileCheck = personalDashService.profileCheck(userId);
        System.out.println("profileCheck::::   " + profileCheck);


        model.addAttribute("userTypeCode", "userTypeCode");
        System.out.println("userTypeCode::::            " + userTypeCode);
        return "jsp/personal/p-dashboard";
    }
    @GetMapping("/myProfile")
    public String myProfileView(HttpSession session,Model model) {
        System.out.println("==== 개인 회원 myProfile====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId::::;     "+userId);
        if (userId == null) {
            return "redirect:/user/login";
        }
        PersonalDashDTO myProfile = personalDashService.getProfile(userId);
        model.addAttribute("profile",myProfile);
        return "jsp/personal/p-profile";
    }

    @PostMapping("/myProfileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody PersonalDashDTO personalDashDTO, Model model, HttpSession session) {
        System.out.println("==== 프로필 저장 ====="+ personalDashDTO);
        Map<Object, String> map = personalDashService.saveProfile(personalDashDTO, session);
        System.out.println("map/////////     "+map);

        return map;
    }

    @GetMapping("/goMyProfile")
    public PersonalDashDTO goMyProfile (@RequestBody PersonalDashDTO personalDashDTO, Model model) {
        System.out.println("==== 내 프로필 보기 ====");

        return null;
    }


    @GetMapping("/changePassword")
    public String changePasswordView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 changePassword====");
        return "jsp/personal/p-changePassword";
    }
    @GetMapping("/myResume")
    public String myResumeView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 myResume====");
        return "jsp/personal/p-myResume";
    }
    @GetMapping("/manageJobs")
    public String manageJobsView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 manageJobs====");
        return "jsp/personal/p-manageJobs";
    }
    @GetMapping("/savedJobs")
    public String savedJobsView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 savedJobs====");
        return "jsp/personal/p-savedJobs";
    }
    @GetMapping("/pricingPlan")
    public String pricingPlanView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 pricingPlan====");
        return "jsp/personal/p-pricingPlan";
    }
}
