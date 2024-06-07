package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PersonalDashController {
    private final PersonalDashService personalDashService;
    private final SessionUtil sessionUtil;

    // 매인 대시보드
    @GetMapping("/dashboard")
    public String dashboardView(Model model)  {
        System.out.println("==== 개인 회원 대시보드====");

        // 로그인 체크
        System.out.println("로그인 체크");
        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }

        System.out.println("/로그인 타입코드 체크");
        //로그인 타입코드 확인하기
        if(!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        System.out.println("/프로필 작성 여부 체크");
        // 프로필 작성 여부 확인
        int userNo = (int)sessionUtil.getAttribute("userNo");
        int profileCheck = personalDashService.profileCheck(userNo);
        if(profileCheck == 0) {
            System.out.println("프로필 내용이 없음, 프로필로 이동");
            return "redirect:/personal/myProfile";
        }

        //최근 지원한 리스트 보기
        List<JobApplicationDTO> recentlyApplyJobList = personalDashService.recentlyApplyJobList(userNo);
        System.out.println("==========================> 지원 현황 리스트!"+recentlyApplyJobList);

        model.addAttribute("recentlyApplyJobList", recentlyApplyJobList);
        return "jsp/personal/personal-dashboard";
    }

    // 프로필
    @GetMapping("/myProfile")
    public String myProfileView(Model model) {
        System.out.println("==== 개인 회원 프로필페이지 ====");

        System.out.println("로그인 체크");
        if(!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        System.out.println("/로그인 타입코드 체크");
        //로그인 타입코드 확인하기
        if(!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        UserProfileInfoDTO myProfile = personalDashService.getProfile(userNo); // 기존 작성된 프로필 가져오기
        if (myProfile == null) {
            System.out.println("null인가??");
            return "jsp/personal/personal-profile";
        }

        model.addAttribute("profile",myProfile);
        return "jsp/personal/personal-profile";
    }

    @PostMapping("/myProfileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody UserProfileInfoDTO userProfileInfoDTO) {
        System.out.println("==== 프로필 저장 =====");

        System.out.println("입력한 dto------> "+ userProfileInfoDTO);

        Map<Object, String> map = personalDashService.saveProfile(userProfileInfoDTO); // 프로필 저장하기
        System.out.println("map/////////     "+map);
        return map;
    }

    // 비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView() {
        System.out.println("==== 개인 회원 changePassword====");

        // 로그인 체크
        System.out.println("로그인 체크");
        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }

        //로그인 타입코드 확인하기
        System.out.println("/로그인 타입코드 체크");
        if(!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        return "jsp/personal/personal-changePassword";
    }

    @PostMapping("/goChangePassword")
    @ResponseBody
    public Map<Object, Object> changePassword(@RequestBody UserDTO userDTO) {
        System.out.println("====비밀번호 변경 실행====");

        System.out.println("입력한 내용 확인 : "+userDTO);

        int userNo = (int) sessionUtil.getAttribute("userNo");

        userDTO.setUserNo(userNo);
        Map<Object, Object> map = personalDashService.changePassword(userDTO);
        System.out.println("비밀번호 변경했음. 확인해봄:"+ map);

        return map;
    }

    // 지원현황
    @GetMapping("/manageJobs")
    public String manageJobsView(Model model) {
        System.out.println("==== 개인 회원 manageJobs====");

        // 로그인 체크
        System.out.println("로그인 체크");
        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }

        //로그인 타입코드 확인하기
        System.out.println("/로그인 타입코드 체크");
        if(!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        List<JobApplicationDTO> currentApplyList = personalDashService.currentApplyList();
        System.out.println("==========================> 지원 현황 리스트!"+currentApplyList);
        model.addAttribute("currentApplyList", currentApplyList);
        return "jsp/personal/personal-manageJobs";
    }

    @GetMapping("/savedJobs") // 관심 공고 목록들
    public String savedJobsView() {
        System.out.println("==== 개인 회원 savedJobs====");
        return "jsp/personal/personal-savedJobs";
    }
}
