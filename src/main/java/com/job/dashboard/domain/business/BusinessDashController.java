package com.job.dashboard.domain.business;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.common.CommonService;
import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
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

    //파일 업로드
    @PostMapping("/uploadedFile")
    @ResponseBody
    public Map<String, Object> profileFile(@RequestParam("file") MultipartFile file) throws IOException {
        return businessDashService.saveFile(file);
    }

    //파일 삭제
    @PostMapping("/deleteFile/{fileId}")
    @ResponseBody
    public Map<String, Object> profileFileDelete(@PathVariable("fileId") int fileId){
        Map<String, Object> map = new HashMap<>();
        businessDashService.deleteFile(fileId);

        map.put("code", "success");
        map.put("message", "프로필 삭제가 되었습니다.");
        return map;
    }

    // fileId로 파일 가져오기
    @GetMapping("/uploadedFileGet/{fileId}")
    public ResponseEntity<byte[]> getImgView(@PathVariable("fileId") int fileId) {
        try {
            byte[] imageByteArray = businessDashService.loadFileAsBytes(fileId);
            return new ResponseEntity<>(imageByteArray, HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    //프로필 페이지 - 데이터 있으면 보여줌
    @GetMapping("/profile")
    public String profileView(Model model)  {

        //로그인 확인
        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login";
        }

        //회원 코드 확인
        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            return "redirect:/";
        }

        //기존 프로필 가져오기
        int userNo = (int) sessionUtil.getAttribute("userNo");
        CompanyInfoDTO businessProfileInfo = businessDashService.getBusinessProfileInfo();
        if (businessProfileInfo == null) {
            return "jsp/business/business-profile";
        }

        //파일 조회
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        System.out.println("b:::::::::::: "+businessProfileInfo);
        System.out.println("businessType 확인 :::: "+commonService.getSelectBoxOption("businessType"));
        //common으로 option code가져오기
        model.addAttribute("industry",commonService.getSelectBoxOption("industry"));
        model.addAttribute("businessType",commonService.getSelectBoxOption("businessType"));
        model.addAttribute("company", businessProfileInfo);

        return "jsp/business/business-profile";
    }

    //프로필 저장 (파일 같이)
    @PostMapping("/insertProfile")
    @ResponseBody
    public Map<String, Object> insertProfile(CompanyInfoDTO companyInfoDTO) {

        //로그인 확인
        if(!sessionUtil.loginUserCheck()) {
            throw new CustomException(ExceptionErrorCode.UNAUTHORIZED_USER_TOKEN);
        }

        //회원 코드 확인
        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) {
            throw new CustomException(ExceptionErrorCode.INVALID_MEMBER_TOKEN);
        }

        return businessDashService.insertProfile(companyInfoDTO);
    }

    //비밀번호 변경
    @GetMapping("/changePassword")
    public String changePasswordView(Model model)  {

        if(!sessionUtil.loginUserCheck()) {
            return "redirect:/user/login?test=true";
        }

        //회사 이름
        CompanyInfoDTO businessProfile = businessDashService.getBusinessProfileInfo();
        model.addAttribute("company", businessProfile);

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/business/business-changePassword";
    }


    //공고 관리
    @GetMapping("/managePostJob")
    public String managePostJobView(Model model) {

        if(!sessionUtil.loginUserCheck()) { // 로그인
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"), "20")) { //회원 타입
            return "redirect:/";
        }

        //프로필 작성 확인
        CompanyInfoDTO businessProfileInfo = businessDashService.getBusinessProfileInfo();
        if (businessProfileInfo == null) {
            return "redirect:/business/profile";
        }

        //회사 이름
        model.addAttribute("company", businessProfileInfo); //굳이 프로필 전부를 가져올 필요가 있을까?

        //파일 조회
        int userNo = (int) sessionUtil.getAttribute("userNo");
        FileDTO file = businessDashService.getFile(userNo);
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

        Map<String, Object> response = new HashMap<>();
        response.put("list", postJobList.getList());
        response.put("total", postJobList.getTotal());
        response.put("pageNum", postJobList.getPageNum());
        response.put("pageSize", postJobList.getPageSize());
        response.put("pages", postJobList.getPages());

        System.out.println("response:::::    "+response);
        return response;
    }

    //작성한 공고에 지원한 지원자 리스트
    @GetMapping("/candidateList")
    public String candidateListView (@RequestParam("jobId") int jobId, Model model) {

        model.addAttribute("id", jobId);
        return "jsp/business/business-manageCandidate";
    }

    @GetMapping("/ajax/candidateList")
    @ResponseBody
    public Map<String, Object> ajaxCandidateList (@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                                  @RequestParam(defaultValue = "1") int pageNum,
                                                  @RequestParam(defaultValue = "10") int pageSize,
                                                  @RequestParam(value = "jobNum") int jobId) {
        PageInfo<JobApplicationDTO> candidateList = businessDashService.getCandidateList(keyword, pageNum, pageSize, jobId);

        Map<String, Object> response = new HashMap<>();
        response.put("list", candidateList.getList());
        response.put("total", candidateList.getTotal());
        response.put("pageNum", candidateList.getPageNum());
        response.put("pageSize", candidateList.getPageSize());
        response.put("pages", candidateList.getPages());

        return response;
    }

    // 지원한 지원자 상세보기
    @GetMapping("/candidateDetail")
    public String candidateDetailView (@RequestParam("userNo") int userNo, @RequestParam("jobId") int jobId, Model model) {

        JobApplicationDTO candidateDetailInfo = businessDashService.getCandidateDetailInfo(userNo,jobId);

        model.addAttribute("candidateDetailInfo",candidateDetailInfo);

        return "jsp/business/business-candidateDetail";
    }

    // 채용
    @PostMapping("/employCandidate")
    @ResponseBody
    public Map<String, Object> employCandidate(@RequestBody JobApplicationDTO jobApplicationDTO) {

        return businessDashService.employCandidate(jobApplicationDTO);
    }

    // 채용 취소
    @PostMapping("/cancelEmployCandidate")
    @ResponseBody
    public Map<String, Object> cancelEmployCandidate (@RequestBody JobApplicationDTO jobApplicationDTO) {
        System.out.println("jobApplicationDTO 확인 : "+ jobApplicationDTO);

        return businessDashService.cancelEmployCandidate(jobApplicationDTO);
    }


}
