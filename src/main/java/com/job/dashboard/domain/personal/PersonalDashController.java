package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.util.SessionUtil;
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
    private final SessionUtil sessionUtil;

    /** dashboard에서 무조건 프로필부터 작성하도록 만들고, 작성후 name을 사진 옆에 띄여주기
     * */
    // 매인 대시보드
    @GetMapping("/dashboard")
    public String dashboardView(HttpSession session, Model model)  {
        System.out.println("==== 개인 회원 대시보드====");

        if(!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        //코드 확인하기
        if(!Objects.equals(session.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        // 프로필 작성 여부 확인
        Integer userNo = (Integer)sessionUtil.getAttribute("userNo");
        if(userNo == null) {
            System.out.println("아무것도 안들어옴 null값임");
        }
        //지원한 리스트 보기
        List<JobApplicationDTO> applyJobList = personalDashService.applyJobList(userNo);
        System.out.println("==========================> 지원 현황 리스트!"+applyJobList);

        model.addAttribute("applyJobList", applyJobList);
        return "jsp/personal/p-dashboard";
    }

    // 프로필
    @GetMapping("/myProfile")
    public String myProfileView(Model model) {
        System.out.println("==== 개인 회원 프로필페이지 ====");

        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        PersonalDashDTO myProfile = personalDashService.getProfile(userNo); // 기존 작성된 프로필 가져오기
        if (myProfile == null) {
            System.out.println("null인가??");
            return "jsp/personal/p-profile";
        }

        model.addAttribute("profile",myProfile);
        return "jsp/personal/p-profile";
    }

    @PostMapping("/myProfileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody PersonalDashDTO personalDashDTO) {
        System.out.println("==== 프로필 저장 =====");

        System.out.println("입력한 dto------> "+personalDashDTO);

        Map<Object, String> map = personalDashService.saveProfile(personalDashDTO); // 프로필 저장하기
        System.out.println("map/////////     "+map);
        return map;
    }

    // 비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView() {
        System.out.println("==== 개인 회원 changePassword====");
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        System.out.println("userNo::::;     "+userNo);
        if (!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }
        return "jsp/personal/p-changePassword";
    }

    @PostMapping("/goChangePassword")
    @ResponseBody
    public Map<Object, Object> changePassword(@RequestBody UserDTO userDTO) {
        System.out.println("====비밀번호 변경 실행====");

        System.out.println("입력한 내용 확인 : "+userDTO);

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        userDTO.setUserNo(userNo);
        Map<Object, Object> map = personalDashService.changePassword(userDTO);
        System.out.println("비밀번호 변경했음. 확인해봄:"+ map);
        return map;
    }

    @GetMapping("/manageJobs")
    public String manageJobsView(HttpSession session, Model model) {
        System.out.println("==== 개인 회원 manageJobs====");
        if (!sessionUtil.loginUserCheck()) { // 로그인 후 이용가능
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "10")) {
            return "redirect:/";
        }

        List<JobApplicationDTO> applyList = personalDashService.applyList();
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

    // 지원 공고 자세히 보기는 redirect:/post/detail 로 바로 감

    @GetMapping("/savedJobs") // 관심 공고 목록들
    public String savedJobsView() {
        System.out.println("==== 개인 회원 savedJobs====");
        return "jsp/personal/p-savedJobs";
    }
}
