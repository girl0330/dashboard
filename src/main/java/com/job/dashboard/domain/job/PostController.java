package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.common.CommonService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.notification.NotificationService;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    private final NotificationService notificationService;
    private final BusinessDashService businessDashService;

    //공고작성 페이지
    @GetMapping("/writePostJob")
    public String writePostJobView(HttpServletRequest request, Model model) {

        //이전 페이지 session저장
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            String currentUrl = request.getRequestURL().toString();
            request.getSession().setAttribute("prevPage", currentUrl);
            return "jsp/login";
        }

        //프로필 작성 확인
        int userNo = (int) sessionUtil.getAttribute("userNo");
        int profileCheck = postService.profileCheck(userNo);
        if (profileCheck < 1) {
            return "redirect:/business/profile";
        }

        //파일 조회
        FileDTO file = businessDashService.getFile(userNo);
        if (file != null) {
            model.addAttribute("fileId", file.getFileId());
        }

        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/insertPost")
    @ResponseBody
    public Map<String, Object> insertPost (@RequestBody JobPostDTO jobPostDTO) {

         //로그인한 id를 직접 넣을거임
        return postService.insertPost(jobPostDTO);
    }


    //공고리스트 이동
    @GetMapping("/postJobList")
    public String jobPostView(Model model) {

        if (sessionUtil.loginUserCheck()) {
            int userNo = (int) sessionUtil.getAttribute("userNo");
            //파일 조회
            FileDTO file = businessDashService.getFile(userNo);
            if (file != null) {
                model.addAttribute("fileId", file.getFileId());
            }
        }
        return "jsp/post/job-list";
    }

    //ajax 공고 리스트
    @GetMapping("/ajax/postJobList")
    @ResponseBody
    public Map<String, Object> ajaxJobPostList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
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

        return response;
    }


    //공고 상세 페이지
    @GetMapping("/jobPostDetail")
    public String jobPostDetailView(@RequestParam("jobId") int jobId, Model model) {
        Map<String, Object> map = new HashMap<>();

        if (sessionUtil.loginUserCheck()) { // 로그인시
            int userNo = (int) sessionUtil.getAttribute("userNo");
            map.put("userNo", userNo);
            map.put("jobId", jobId);

            int like = postService.findLike(map);

            int userStatusCode = postService.getCountUserStatusCode(map);
            model.addAttribute("userStatusCode",userStatusCode);
            model.addAttribute("like", like);
        }
        JobPostDTO jobPostDetail = postService.getJobPostDetailInfo(jobId);

        model.addAttribute("jobPostDetail",jobPostDetail);
        return "jsp/post/job-detail";
    }

    //좋아요 관리
    @PostMapping("/like/{jobId}")
    @ResponseBody
    public Map<String, Object> likeControl(@PathVariable int jobId, HttpServletRequest request) {

        return postService.likeControl(jobId, request);
    }

    //공고 수정
    @GetMapping("/updateJobPost")
    public String updateJobPostView(@RequestParam("jobId") int jobId, Model model) {
        int userNo = (int) sessionUtil.getAttribute("userNo"); //로그인한 userNo 가져옴

        JobPostDTO initialData = postService.getJobPostDetailInfo(jobId);
        if (initialData.getUserNo() != userNo) {
            return "redirect:/";
        }

        model.addAttribute("jobType",commonService.getSelectBoxOption("job_type"));
        model.addAttribute("salaryType",commonService.getSelectBoxOption("salary_type"));
        model.addAttribute("employmentType",commonService.getSelectBoxOption("employment_type"));
        model.addAttribute("jobDayType",commonService.getSelectBoxOption("job_day_type"));
        model.addAttribute("statusType",commonService.getSelectBoxOption("status_type"));
        model.addAttribute("initialData",initialData);

        return "jsp/post/post-a-job-update";
    }

    @PostMapping("/updateJobPost/{jobId}")
    @ResponseBody
    public Map<String, Object> updateJobPost (@RequestBody JobPostDTO jobPostDTO ) {

        int userNo = (int) sessionUtil.getAttribute("userNo");
        return postService.updateJobPost(userNo, jobPostDTO);
    }

    //게시글 삭제
    @GetMapping("/deleteJobPost")
    public String deleteJobPost(@RequestParam("jobId") int jobId){

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        postService.deleteJobPost(jobId);
        return "jsp/post/job-list";
    }
    @PostMapping("ajax/checkDuplicateApply")
    @ResponseBody
    public Map<String, Object> checkDuplicateApply(@RequestBody JobApplicationDTO jobApplicationDTO){ //jobId
        return postService.checkDuplicateApply(jobApplicationDTO);
    }

    @PostMapping("/apply")
    @ResponseBody
    public Map<String, Object> applyJobPost(@RequestBody JobApplicationDTO jobApplicationDTO){ //jobId
        return postService.applyJobPost(jobApplicationDTO);
    }

    @PostMapping("/applyCancel")
    @ResponseBody
    public Map<String, Object> applyCancelJob(@RequestBody Integer jobId){
        return postService.applyCancelJob(jobId);
    }

    //알람 리스트 api
    @GetMapping("/api/notificationList")
    @ResponseBody
    public List<NotificationDTO> alramList() {

        int userNo = (int) sessionUtil.getAttribute("userNo");

        List<NotificationDTO> notificationList = notificationService.getNotificationsByUserId(userNo);

        return notificationList;
    }

 }
