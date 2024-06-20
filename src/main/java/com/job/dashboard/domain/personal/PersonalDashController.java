package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PersonalDashController {
    private final PersonalDashService personalDashService;
    private final BusinessDashService businessDashService;
    private final SessionUtil sessionUtil;

    // dashboard 리스트
    @GetMapping("/dashboard")
    public String dashboardView(Model model) {
        System.out.println("==== 개인 회원 대시보드====");
        int userNo = (int)sessionUtil.getAttribute("userNo");

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

        // 프로필 작성 여부 확인
        int profileCheck = personalDashService.profileCheck(userNo);
        if(profileCheck == 0) {
            System.out.println("프로필 내용이 없음, 프로필로 이동");
            return "redirect:/personal/myProfile";
        }

        //파일 조회
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            System.out.println("file 확인 : "+file);
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/personal/personal-dashboard";
    }


    //ajax dashboard 리스트 -(지원한 공고)
    @GetMapping("/ajax/dashboardList")
    @ResponseBody
    public Map<String, Object> ajaxDashboardList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize) {

        PageInfo<JobApplicationDTO> recentlyApplyJobList = personalDashService.applyJobList(keyword, pageNum, pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("list", recentlyApplyJobList.getList());
        response.put("total", recentlyApplyJobList.getTotal());
        response.put("pageNum", recentlyApplyJobList.getPageNum());
        response.put("pageSize", recentlyApplyJobList.getPageSize());
        response.put("pages", recentlyApplyJobList.getPages());

        System.out.println("response:::::    "+response);
        return response;
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

        //파일 조회
        FileDTO file = businessDashService.getFile(userNo);

        if (file != null) {
            System.out.println("file 확인 : "+file);
            model.addAttribute("fileId", file.getFileId());
        }

        System.out.println("file 확인 : "+file);

        model.addAttribute("profile",myProfile);
        return "jsp/personal/personal-profile";
    }

    @PostMapping("/myProfileSave")
    @ResponseBody
    public Map<Object, String> profileSave(UserProfileInfoDTO userProfileInfoDTO) throws IOException {
        System.out.println("==== 프로필 저장 =====");

        System.out.println("입력한 dto------> "+ userProfileInfoDTO);

        Map<Object, String> map = personalDashService.saveProfile(userProfileInfoDTO); // 프로필 저장하기
        System.out.println("map/////////     "+map);
        return map;
    }

    // 비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView(Model model) {
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

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            System.out.println("file 확인 : "+file);
            model.addAttribute("fileId", file.getFileId());
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

    // manageJobsList
    @GetMapping("/manageJobs")
    public String manageJobsView(Model model) {
        System.out.println("==== 개인 회원 manageJobs====");

        if(!sessionUtil.loginUserCheck()) { //로그인 체크
            return "redirect:/user/login";
        }

        if(!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) { //로그인 타입코드 체크
            return "redirect:/";
        }

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            System.out.println("file 확인 : "+file);
            model.addAttribute("fileId", file.getFileId());
        }

        int profileCheck = personalDashService.profileCheck(userNo);
        if(profileCheck == 0) {
            System.out.println("프로필 내용이 없음, 프로필로 이동");
            return "redirect:/personal/myProfile";
        }

        return "jsp/personal/personal-manageJobs";
    }

    //ajax manageJobsList -(지원 현황)
    @GetMapping("/ajax/manageJobsList")
    @ResponseBody
    public Map<String, Object> ajaxManageJobsList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize,
                                                  Model model) {

        PageInfo<JobApplicationDTO> recentlyApplyJobList = personalDashService.applyStatusList(keyword, pageNum, pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("list", recentlyApplyJobList.getList());
        response.put("total", recentlyApplyJobList.getTotal());
        response.put("pageNum", recentlyApplyJobList.getPageNum());
        response.put("pageSize", recentlyApplyJobList.getPageSize());
        response.put("pages", recentlyApplyJobList.getPages());

        System.out.println("response:::::    "+response);
        return response;
    }

    // 관심 공고 목록들
    @GetMapping("/savedJobs")
    public String savedJobsView(Model model) {
        System.out.println("==== 개인 회원 savedJobs====");

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

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            System.out.println("file 확인 : "+file);
            model.addAttribute("fileId", file.getFileId());
        }

        // 프로필 작성 여부 확인
        int profileCheck = personalDashService.profileCheck(userNo);
        if(profileCheck == 0) {
            System.out.println("프로필 내용이 없음, 프로필로 이동");
            return "redirect:/personal/myProfile";
        }

        return "jsp/personal/personal-savedJobs";
    }
}
