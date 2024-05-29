package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PersonalDashController {
    private final PersonalDashService personalDashService;

    // 매인 대시보드
    @GetMapping("/dashboard")
    public String dashboardView(HttpSession session, Model model)  {
        System.out.println("==== 개인 회원 대시보드====");
        Integer userId = (Integer) session.getAttribute("userId");
        String userTypeCode = (String) session.getAttribute("userTypeCode");
        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println("userEmail;;;;::    " + userEmail);
        System.out.println("userId::::;     " + userId);
        if (userId == null) { // 로그인 후 이용가능
                return "redirect:/user/login";
        }

        model.addAttribute("userTypeCode", "userTypeCode"); //유저코드 '10' 이용가능
        System.out.println("userTypeCode::::            " + userTypeCode);
        if (!Objects.equals(userTypeCode, "10")) {
            return "redirect:/";
        }
//        Boolean profileCheck = personalDashService.profileCheck(userId);   //프로필이 작성 유무

//        System.out.println("profileCheck::::   " + profileCheck);
//
//            if (!profileCheck) { // 프로필 작성 후 이용가능
//                return "redirect:/personal/myProfile";
//            } else {
//
//            }
        return "jsp/personal/p-dashboard";
    }

    // 프로필
    @GetMapping("/myProfile")
    public String myProfileView(HttpSession session,Model model) {
        System.out.println("==== 개인 회원 프로필페이지 ====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId::::;     "+userId);
        if (userId == null) { // 회원만 이용가능
            return "redirect:/user/login";
        }
        PersonalDashDTO myProfile = personalDashService.getProfile(userId); // 기존 작성된 프로필 가져오기
        if (myProfile == null) {
            System.out.println("null인가??");
            return "jsp/personal/p-profile";
        }

        model.addAttribute("profile",myProfile);
        return "jsp/personal/p-profile";
    }

    @PostMapping("/myProfileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody PersonalDashDTO personalDashDTO, HttpSession session) {
        System.out.println("==== 프로필 저장 =====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("suerID ------->"+userId);
        personalDashDTO.setUserId(userId);
        System.out.println("입력한 dto------> "+personalDashDTO);
        Map<Object, String> map = personalDashService.saveProfile(personalDashDTO, session); // 프로필 저장하기
        System.out.println("map/////////     "+map);
        return map;
    }

    // 비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView(HttpSession session) {
        System.out.println("==== 개인 회원 changePassword====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId::::;     "+userId);
        if (userId == null) { // 회원만 이용가능
            return "redirect:/user/login";
        }
        return "jsp/personal/p-changePassword";
    }

    @PostMapping("/goChangePassword")
    @ResponseBody
    public Map<Object, Object> changePassword(@RequestBody UserDTO userDTO, HttpSession session, Model model) {
        System.out.println("====비밀번호 변경 실행====");
        System.out.println("입력한 내용 확인 : "+userDTO);
        Integer userId = (Integer) session.getAttribute("userId");
        userDTO.setUserId(userId);
        Map<Object, Object> map = personalDashService.changePassword(userDTO);
        System.out.println("비밀번호 변경했음. 확인해봄:"+ map);
        System.out.println("userDto???" + userDTO);
        return map;
    }

    @GetMapping("/myResume")
    public String myResumeView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 myResume====");
        return "jsp/personal/p-myResume";
    }
    @GetMapping("/manageJobs")
    public String manageJobsView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 manageJobs====");
        Integer userId = (Integer) session.getAttribute("userId");
        String userTypeCode = (String) session.getAttribute("userTypeCode");
        System.out.println("userId::::;     " + userId);
        if (userId == null) { // 로그인 후 이용가능
            return "redirect:/user/login";
        }
        System.out.println("userTypeCode::::            " + userTypeCode);
        if (!Objects.equals(userTypeCode, "10")) {
            return "redirect:/";
        }
        List<JobApplicationDTO> applyList = personalDashService.applyList(userId);
        System.out.println("==========================> 지원 현황 리스트!"+applyList);
        model.addAttribute("applyList", applyList);
        return "jsp/personal/p-manageJobs";
    }

    @PostMapping("/applyListDelete")
    @ResponseBody
    public Map<String, Object> applyListDelete(@RequestBody int applicationId){
        System.out.println("지원리스트 삭제"+applicationId);
        Map<String, Object> map = personalDashService.applyListDelete(applicationId);
        System.out.println("map확인 "+map);
        return map;
    }

//    @PostMapping("/applyListLook")
//    public String applyListLook(@RequestBody int jobId){
//        System.out.println("지원리스트 자세히 보기 jobId"+jobId);
//
//        JobPostDTO postDetailView = personalDashService.postDetailView(jobId);
//        return "jsp/post/job-detail";
//    }

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
