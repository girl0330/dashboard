package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.common.CommonService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.file.FileService;
//import com.job.dashboard.domain.notification.NotificationService;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class PostController {
    private final PostService postService;
    private final SessionUtil sessionUtil;
    private final CommonService commonService;
//    private final NotificationService notificationService;
    private final BusinessDashService businessDashService;
    private final FileService fileService;

    //공고작성 페이지
    @GetMapping("/writePostJob")
    public String writePostJobView(HttpServletRequest request, HttpServletResponse response, Model model) {
        System.out.println("공고 작성");

        //이전 페이지 session저장
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            System.out.println("로그인 안됨. 리다이렉트 저장되는지 확인 ");
            String currentUrl = request.getRequestURI();
            sessionUtil.setRedirectUrl(currentUrl);
            System.out.println("리다이렉트 확인::: "+sessionUtil.getRedirectUrl());
            return "jsp/login";
        }

        //프로필 작성 확인
        int userNo = (int) sessionUtil.getAttribute("userNo");
        int profileCheck = postService.profileCheck(userNo);
        if (profileCheck < 1) {
            return "redirect:/business/profile";
        }

        FileDTO file = fileService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/ajax/insertPost")
    @ResponseBody
    public ResponseEntity<?> insertPost (@RequestBody JobPostDTO jobPostDTO) {
         //로그인한 id를 직접 넣을거임
        ApiResponse response = postService.insertPost(jobPostDTO);
        return ResponseEntity.ok(response);
    }


    //공고리스트 이동
    @GetMapping("/postJobList")
    public String jobPostView(Model model) {

        if (sessionUtil.loginUserCheck()) {
            int userNo = (int) sessionUtil.getAttribute("userNo");
            //파일 조회
            FileDTO file = fileService.getFile(userNo);
            if (file != null) {
                model.addAttribute("fileId", file.getFileId());
            }
        }
        return "jsp/post/job-list";
    }

    //ajax 공고 리스트
    @GetMapping("/ajax/postJobList")
    @ResponseBody
    public ResponseEntity<?> ajaxJobPostList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize) {

        String userTypeCode = (String) sessionUtil.getAttribute("userTypeCode");
        PageInfo<JobPostDTO> jobList = postService.jobList(keyword, pageNum, pageSize);
        List<LikeDTO> likeList = postService.getLikeList();

        Map<String, Object> response = new HashMap<>();
        response.put("userTypeCode", userTypeCode);
        response.put("list", jobList.getList());
        response.put("likeList", likeList);
        response.put("total", jobList.getTotal());
        response.put("pageNum", jobList.getPageNum());
        response.put("pageSize", jobList.getPageSize());
        response.put("pages", jobList.getPages());

        return ResponseEntity.ok(response);
    }


    //공고 상세 페이지
    @GetMapping("/jobPostDetail")
    public String jobPostDetailView(@RequestParam("jobId") int jobId, Model model) {

        if (sessionUtil.loginUserCheck()) {
            int userNo = (int) sessionUtil.getAttribute("userNo");

            FileDTO file = fileService.getFile(userNo);
            if (file != null) {
                model.addAttribute("fileId", file.getFileId());
            }

            JobPostDTO jobPostDTO = new JobPostDTO();
            jobPostDTO.setUserNo(userNo);
            jobPostDTO.setJobId(jobId);

            int like = postService.findLike(jobPostDTO); //todo:  dto 이름이 거슬리는데...

            int userStatusCode = postService.getCountUserStatusCode(jobPostDTO);

            model.addAttribute("userStatusCode",userStatusCode);//공고 지원상태 확인 (0: 지원/ 1: 지원안함)
            model.addAttribute("like", like);
        }
        JobPostDTO jobPostDetail = postService.getJobPostDetailInfo(jobId);

        model.addAttribute("jobPostDetail",jobPostDetail);
        return "jsp/post/job-detail";
    }

    //좋아요 관리
    @PostMapping("/ajax/like/{jobId}")
    @ResponseBody
    public ResponseEntity<?> likeControl(@PathVariable int jobId) {
        ApiResponse response = postService.likeControl(jobId);
        return ResponseEntity.ok(response);
    }

    //공고 수정
    @GetMapping("/updateJobPost")
    public String updateJobPostView(@RequestParam("jobId") int jobId, Model model) {
        int userNo = (int) sessionUtil.getAttribute("userNo"); //로그인한 userNo 가져옴

        JobPostDTO jopPostDetail = postService.getJobPostDetailInfo(jobId); //todo: initialData-> jopPostDetail 바꾸기
        if (jopPostDetail.getUserNo() != userNo) {
            return "redirect:/";
        }

        model.addAttribute("jobType",commonService.getSelectBoxOption("job_type"));
        model.addAttribute("salaryType",commonService.getSelectBoxOption("salary_type"));
        model.addAttribute("employmentType",commonService.getSelectBoxOption("employment_type"));
        model.addAttribute("jobDayType",commonService.getSelectBoxOption("job_day_type"));
        model.addAttribute("statusType",commonService.getSelectBoxOption("status_type"));
        model.addAttribute("jopPostDetail",jopPostDetail);

        return "jsp/post/post-a-job-update";
    }

    @PostMapping("/ajax/updateJobPost/{jobId}") //todo: 수정화면에서 프로필 이미지가 기본으로 노출중임
    @ResponseBody
    public ResponseEntity<?> updateJobPost (@RequestBody JobPostDTO jobPostDTO ) {
        ApiResponse response = postService.updateJobPost(jobPostDTO);
        return ResponseEntity.ok(response);
    }

    //게시글 삭제
    @GetMapping("/deleteJobPost")
    public String deleteJobPost(@RequestParam("jobId") int jobId){
        postService.deleteJobPost(jobId);
        return "jsp/post/job-list";
    }

    /**
     * 중복지원 체크하기
     * @param jobApplicationDTO
     * @return
     */
    @PostMapping("/ajax/checkDuplicateApply")
    @ResponseBody
    public ResponseEntity<?> checkDuplicateApply(@RequestBody JobApplicationDTO jobApplicationDTO){ //todo: ResponseEntity<?>로 전달하기
        ApiResponse response = postService.checkDuplicateApply(jobApplicationDTO);
        return ResponseEntity.ok(response);
    }

    /**
     * 지원하기
     * @param jobApplicationDTO
     * @return
     */ //todo: ajax 비동기통신
    @PostMapping("/ajax/apply")
    @ResponseBody
    public ResponseEntity<?> applyJobPost(@RequestBody JobApplicationDTO jobApplicationDTO){
        ApiResponse response = postService.applyJobPost(jobApplicationDTO);
        System.out.println("response확인 : "+response);
        return ResponseEntity.ok(response);
    }

    //todo: ajax 비동기통신
    @PostMapping("/ajax/applyCancel")//todo: ResponseEntity<?>로 전달하기
    @ResponseBody
    public ResponseEntity<?> applyCancelJob(@RequestBody Integer jobId){
        ApiResponse response = postService.applyCancelJob(jobId);
        return ResponseEntity.ok(response);
    }

    //알람 리스트 api
//    @GetMapping("/api/notificationList") //todo: 기능 다시 공부하기
//    @ResponseBody
//    public List<NotificationDTO> alramList() {
//
//        int userNo = (int) sessionUtil.getAttribute("userNo");
//
////        List<NotificationDTO> notificationList = notificationService.getNotificationsByUserId(userNo);
//
//        return notificationList;
//    }

 }
