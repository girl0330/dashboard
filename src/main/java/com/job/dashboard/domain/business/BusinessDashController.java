package com.job.dashboard.domain.business;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.common.CommonService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.file.FileController;
import com.job.dashboard.domain.file.FileService;
import com.job.dashboard.domain.job.PostService;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
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
    private final CommonService commonService;
    private final FileService fileService;

    //프로필 페이지 - 데이터 있으면 보여줌
    @GetMapping("/profile")
    public String profileView(Model model)  {

        //기존 프로필 가져오기
        CompanyInfoDTO businessProfileInfo = businessDashService.getBusinessProfileInfo();

        //파일 조회
        if (businessProfileInfo.getFileDTO() != null) {
            model.addAttribute("fileId", businessProfileInfo.getFileDTO().getFileId());
        }

        //common으로 option code가져오기
        model.addAttribute("industry",commonService.getSelectBoxOption("industry"));
        model.addAttribute("businessType",commonService.getSelectBoxOption("business_type"));
        model.addAttribute("company", businessProfileInfo);

        return "jsp/business/business-profile";
    }

    //프로필 저장 (파일 같이)
    @PostMapping("/ajax/insertProfile")
    @ResponseBody
    public ResponseEntity<?> insertProfile(CompanyInfoDTO companyInfoDTO) {
        ApiResponse response = businessDashService.insertProfile(companyInfoDTO);
        return ResponseEntity.ok(response);
    }

    //비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView(Model model)  {

        //회사 이름
        CompanyInfoDTO businessProfile = businessDashService.getBusinessProfileInfo();
        model.addAttribute("company", businessProfile);

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/business/business-changePassword";
    }

    @PostMapping("/ajax/changePassword")
    public ResponseEntity<?> changePassword(@RequestBody UserDTO userDTO) {
        int userNo = (int)sessionUtil.getAttribute("userNo");
        userDTO.setUserNo(userNo);

        ApiResponse response = businessDashService.changePassword(userDTO);
        return ResponseEntity.ok(response);
    }


    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView(Model model) {
        //프로필 작성 확인
        CompanyInfoDTO businessProfileInfo = businessDashService.getBusinessProfileInfo();
        if (businessProfileInfo == null) {
            return "redirect:/business/profile";
        }

        //회사 이름
        model.addAttribute("company", businessProfileInfo);

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/business/business-managePostJob";
    }

    @GetMapping("/ajax/managePostJob")
    @ResponseBody
    public Map<String, Object> ajaxManagePostJob(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                                 @RequestParam(defaultValue = "1") int pageNum,
                                                 @RequestParam(defaultValue = "10") int pageSize) {
        PageInfo<JobPostDTO> postJobList = businessDashService.getPostJobList(keyword, pageNum, pageSize);

        int userNo = (int)sessionUtil.getAttribute("userNo");

        Map<String, Object> response = new HashMap<>();
        response.put("list", postJobList.getList());
        response.put("total", postJobList.getTotal());
        response.put("userNo",userNo);
        response.put("pageNum", postJobList.getPageNum());
        response.put("pageSize", postJobList.getPageSize());
        response.put("pages", postJobList.getPages());
        return response;
    }

    //작성한 공고에 지원한 지원자 리스트
    @GetMapping("/candidateList")
    public String candidateListView (@RequestParam("jobId") int jobId, Model model) {

        int userNo = (int)sessionUtil.getAttribute("userNo");//로그인한 userNo
        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        model.addAttribute("userNo", userNo);
        model.addAttribute("id", jobId);
        return "jsp/business/business-manageCandidate";
    }

    @GetMapping("/ajax/candidateList")
    @ResponseBody
    public Map<String, Object> ajaxCandidateList (@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                                  @RequestParam(defaultValue = "1") int pageNum,
                                                  @RequestParam(defaultValue = "10") int pageSize,
                                                  @RequestParam(value = "jobNum") int jobId,
                                                  @RequestParam int userNo) {
        PageInfo<JobApplicationDTO> candidateList = businessDashService.getCandidateList(keyword, pageNum, pageSize, jobId);

        Map<String, Object> response = new HashMap<>();
        response.put("list", candidateList.getList());
        response.put("loginUserNo", userNo);
        response.put("total", candidateList.getTotal());
        response.put("pageNum", candidateList.getPageNum());
        response.put("pageSize", candidateList.getPageSize());
        response.put("pages", candidateList.getPages());

        return response;
    }

    // 지원한 지원자 상세보기
    @GetMapping("/candidateDetail")
    public String candidateDetailView (@RequestParam("userNo") int userNo, @RequestParam("jobId") int jobId, Model model) {

        int businessUserNo = (int) sessionUtil.getAttribute("userNo");

        FileDTO file = fileService.getFile(businessUserNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        //프로필 작성 확인
        CompanyInfoDTO businessProfileInfo = businessDashService.getBusinessProfileInfo();
        if (businessProfileInfo == null) {
            return "redirect:/business/profile";
        }

        //회사 이름
        model.addAttribute("company", businessProfileInfo);
        model.addAttribute("userNo", businessUserNo);

        JobApplicationDTO candidateDetailInfo = businessDashService.getCandidateDetailInfo(userNo,jobId);

        model.addAttribute("candidateDetailInfo",candidateDetailInfo);

        return "jsp/business/business-candidateDetail";
    }

    // 채용
    @PostMapping("/ajax/employ")
    @ResponseBody
    public ResponseEntity<?> employCandidate(@RequestBody JobApplicationDTO jobApplicationDTO) {
        ApiResponse response = businessDashService.employCandidate(jobApplicationDTO);
        return ResponseEntity.ok(response);
    }

    // 채용 취소
    @PostMapping("/ajax/cancelEmploy")
    @ResponseBody
    public ResponseEntity<?> cancelEmployCandidate (@RequestBody JobApplicationDTO jobApplicationDTO) {
        ApiResponse response = businessDashService.cancelEmployCandidate(jobApplicationDTO);
        return ResponseEntity.ok(response);
    }


}
