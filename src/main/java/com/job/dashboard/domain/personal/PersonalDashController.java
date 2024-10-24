package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.file.FileService;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/personal")
public class PersonalDashController {
    private final PersonalDashService personalDashService;
    private final BusinessDashService businessDashService;
    private final SessionUtil sessionUtil;
    private final FileService fileService;

    // dashboard 리스트
    @GetMapping("/dashboard")
    public String dashboardView(Model model) {
        int userNo = (int)sessionUtil.getAttribute("userNo");

        //파일 조회
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }
        //이름 노출 시키기
        UserInfoDTO myProfile = personalDashService.getProfileInfo(userNo);
        if (myProfile != null) {
            model.addAttribute("profile", myProfile);
        }

        return "jsp/personal/personal-dashboard";
    }


    //ajax dashboard 리스트 -(지원한 공고)
    @GetMapping("/ajax/dashboardList")
    @ResponseBody
    public Map<String, Object> ajaxDashboardList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize) {

        PageInfo<JobApplicationDTO> dashboardList = personalDashService.getDashboardList(keyword, pageNum, pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("list", dashboardList.getList());
        response.put("total", dashboardList.getTotal());
        response.put("pageNum", dashboardList.getPageNum());
        response.put("pageSize", dashboardList.getPageSize());
        response.put("pages", dashboardList.getPages());

        return response;
    }

    // 프로필
    @GetMapping("/myProfile")
    public String myProfileView(Model model) {

        // 작성된 프로필 확인
        int userNo = (int) sessionUtil.getAttribute("userNo");
        UserInfoDTO myProfile = personalDashService.getProfileInfo(userNo);
        System.out.println("myProfile = " + myProfile);

        //파일 조회
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        model.addAttribute("profile",myProfile);
        return "jsp/personal/personal-profile";
    }

    @PostMapping("/ajax/insertProfile")
    @ResponseBody
    public ResponseEntity<?> insertProfile(UserInfoDTO userInfoDTO) throws IOException {

        System.out.println("userInfoDTO = " + userInfoDTO);
         ApiResponse response = personalDashService.insertProfile(userInfoDTO);
         return ResponseEntity.ok(response);
    }

    // 비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView(Model model) {

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        //이름 노출 시키기
        UserInfoDTO myProfile = personalDashService.getProfileInfo(userNo);
        model.addAttribute("profile",myProfile);
        return "jsp/personal/personal-changePassword";
    }

    @PostMapping("/ajax/changePassword")
    @ResponseBody
    public ResponseEntity<?> changePassword(@RequestBody UserDTO userDTO) {
        System.out.println("userDTO = " + userDTO);
        int userNo = (int) sessionUtil.getAttribute("userNo");

        userDTO.setUserNo(userNo);
        ApiResponse response = personalDashService.changePassword(userDTO);
        return ResponseEntity.ok(response);
    }

    // manageJobsList
    @GetMapping("/manageJobs")
    public String manageJobsView(Model model) {

        int userNo = (int) sessionUtil.getAttribute("userNo");

        // 프로필 작성 여부 확인
        if (personalDashService.profileCountByUserNo(userNo) == 0) {
            return "redirect:/personal/myProfile";
        }

        //파일 조회
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }
        //이름 노출 시키기
        UserInfoDTO myProfile = personalDashService.getProfileInfo(userNo);
        model.addAttribute("profile",myProfile);

        return "jsp/personal/personal-manageJobs";
    }

    //ajax manageJobsList -(지원 현황)
    @GetMapping("/ajax/manageJobsList")
    @ResponseBody
    public Map<String, Object> ajaxManageJobsList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize) {

        PageInfo<JobApplicationDTO> recentlyApplyJobList = personalDashService.applyStatusList(keyword, pageNum, pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("list", recentlyApplyJobList.getList());
        response.put("total", recentlyApplyJobList.getTotal());
        response.put("pageNum", recentlyApplyJobList.getPageNum());
        response.put("pageSize", recentlyApplyJobList.getPageSize());
        response.put("pages", recentlyApplyJobList.getPages());

        return response;
    }

    // 관심 공고 목록들
    @GetMapping("/likedJobs")
    public String likedJobsView(Model model) {

        int userNo = (int) sessionUtil.getAttribute("userNo");

        // 프로필 작성 여부 확인
        int profileCheck = personalDashService.profileCountByUserNo(userNo);
        if (profileCheck == 0) {
            return "redirect:/personal/myProfile";
        }

        //파일 조회
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }
        //이름 노출 시키기
        UserInfoDTO myProfile = personalDashService.getProfileInfo(userNo);
        model.addAttribute("profile",myProfile);

        return "jsp/personal/personal-likedJobs";
    }

    //ajax likedJobs
    @GetMapping("/ajax/likedJobs")
    @ResponseBody
    public Map<String, Object> ajaxLikedJobsList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                                  @RequestParam(defaultValue = "1") int pageNum,
                                                  @RequestParam(defaultValue = "10") int pageSize) {

        PageInfo<JobPostDTO> likedJobsList = personalDashService.likedJobsList(keyword, pageNum, pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("list", likedJobsList.getList());
        response.put("total", likedJobsList.getTotal());
        response.put("pageNum", likedJobsList.getPageNum());
        response.put("pageSize", likedJobsList.getPageSize());
        response.put("pages", likedJobsList.getPages());

        return response;
    }

}
