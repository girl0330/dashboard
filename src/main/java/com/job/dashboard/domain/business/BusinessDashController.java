package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BusinessDashController {
    private final BusinessDashService businessDashService;
    private final SessionUtil sessionUtil;

    @Value("${image.upload.dir}") //yml에 작성한 업로드한 파일위치
    private String uploadFolder;
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

    //프로필 페이지 - 데이터 있으면 보여줌
    @GetMapping("/profile")
    public String profileView(Model model)  {
        System.out.println("프로필");

        //로그인 확인
        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }

        //로그인 코드 확인
        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }

        CompanyInfoDTO businessProfile = businessDashService.getBusinessProfile();
        System.out.println("프로필 잘가져오기 있음. :"+ businessProfile);
        model.addAttribute("company", businessProfile);

        return "jsp/business/business-profile";
    }

    //프로필 파일 업로드
    @PostMapping("/uploadedFile")
    @ResponseBody
    public Map<Object, String> profileFile(@RequestParam("file") MultipartFile file) throws IOException {
        System.out.println("file확인? : "+file);
        return businessDashService.saveFile(file);
    }

    @GetMapping("/uploadedFileGet/{savedName}")
    public ResponseEntity<byte[]> getImgView(@PathVariable("savedName") String savedName) {
        try {
            byte[] imageByteArray = businessDashService.loadFileAsBytes(savedName);
            return new ResponseEntity<>(imageByteArray, HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @PostMapping("/profileSave")
    @ResponseBody
    public Map<Object, String> profileSave(@RequestBody CompanyInfoDTO companyInfoDTO) {
        System.out.println("====기업 프로필 저장====");

        Map<Object, String> map = businessDashService.saveProfile(companyInfoDTO);
        System.out.println("map"+map);

        return map;
    }

    //비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView()  {
        System.out.println("비번변경");

        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login?test=true";
        }
        return "jsp/business/business-changePassword";
    }


    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView(Model model, @RequestParam(value="keyword", required=false) String keyword) {
        System.out.println("공고관리");
        System.out.println("keyword : "+keyword);
        if(!sessionUtil.loginUserCheck()) {
            System.out.println("로그인 화면으로 이동");
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }

        if (keyword != null) {
            List<JobPostDTO> postJobList = businessDashService.keywordPostJobList(keyword);
            System.out.println("postJobList"+postJobList);

            model.addAttribute("postJobList", postJobList);
            return "jsp/business/business-managePostJob";
        }
        List<JobPostDTO> postJobList = businessDashService.postJobList();
        System.out.println("postJobList"+postJobList);

        model.addAttribute("postJobList", postJobList);
        return "jsp/business/business-managePostJob";
    }

    //작성한 공고에 지원한 지원자 리스트
    @GetMapping("/applicantList")
    public String applicantList (@RequestParam("jobId") int jobId, Model model) {
        System.out.println(" 해당 공고에 지원한 지원자목록/jobId 확인 : "+ jobId);

        List<JobApplicationDTO> applicantList = businessDashService.applicantList(jobId);
        model.addAttribute("applicantList", applicantList);
        return "jsp/business/business-manageCandidate";
    }

    // 지원한 지원자 상세보기
    @GetMapping("/candidateDetail")
    public String candidateDetail (@RequestParam("userNo") int userNo, @RequestParam("jobId") int jobId, Model model) {
        System.out.println("지원한 지원자 상세보기"+userNo+"jobId"+jobId);

        JobApplicationDTO jobApplicationDTO = businessDashService.getCandidateApplyDetail(userNo,jobId);
        System.out.println("확인 : "+jobApplicationDTO);

        model.addAttribute("candidateInfo",jobApplicationDTO);

        return "jsp/business/business-candidateDetail";
    }

    // 채용
    @PostMapping("/applyCandidate")
    @ResponseBody
    public Map<Object, String> applyCandidate (@RequestBody JobApplicationDTO jobApplicationDTO) {
        System.out.println("jobApplicationDTO 확인 : "+ jobApplicationDTO);

        Map<Object, String> map = businessDashService.applyCandidate(jobApplicationDTO);
        System.out.println("map 확인 : "+map);
        return map;
    }

    // 채용 취소
    @PostMapping("/applyCancelCandidate")
    @ResponseBody
    public Map<Object, String> applyCancelCandidate (@RequestBody JobApplicationDTO jobApplicationDTO) {
        System.out.println("jobApplicationDTO 확인 : "+ jobApplicationDTO);

        Map<Object, String> map = businessDashService.applyCancelCandidate(jobApplicationDTO);
        System.out.println("map 확인 : "+map);
        return map;
    }


}
