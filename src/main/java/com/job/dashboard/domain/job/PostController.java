package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.common.CommonService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    //공고 페이지
    @GetMapping("/postAJob")
    public String postAJobView() {

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"),"20")) { // 횐원코드 체크
            return "redirect:/";
        }

        //프로필 작성 확인
        int userNo = (int) sessionUtil.getAttribute("userNo");
        int profileCheck = postService.profileCheck(userNo);
        if (profileCheck == 0) {
            return "redirect:/business/profile";
        }

        System.out.println("usertypecode가 20임 이제 다음으로 진행하겠음.");
        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/insertPost")
    @ResponseBody
    public Map<String, Object> insertPost (@RequestBody JobPostDTO jobPostDTO) {
        Map<String, Object> map = new HashMap<>();

         //로그인한 id를 직접 넣을거임
        map = postService.insertPost(jobPostDTO);
        return map;
    }


    //공고리스트 이동
    @GetMapping("/list")
    public String jobPostView() {
        return "jsp/post/job-list";
    }

    //ajax 공고 리스트
    @GetMapping("/ajax/list")
    @ResponseBody
    public Map<String, Object> ajaxJobPostList(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                               @RequestParam(defaultValue = "1") int pageNum,
                                               @RequestParam(defaultValue = "10") int pageSize) {

        PageInfo<JobPostDTO> jobList = postService.jobList(keyword, pageNum, pageSize);
        List<LikeDTO> likeList = postService.getLikeList();

        Map<String, Object> response = new HashMap<>();
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

            model.addAttribute("like", like);
        }

        JobPostDTO jobPostDetail = postService.getJobPostDetailInfo(jobId);

        model.addAttribute("jobPostDetail",jobPostDetail);
        return "jsp/post/job-detail";
    }

    //좋아요 관리
    @PostMapping("/like/{jobId}")
    @ResponseBody
    public Map<String, Object> likeControl(@PathVariable int jobId) {

        return postService.likeControl(jobId);
    }

    //공고 수정
    @GetMapping("/update")
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

        return "jsp/post/post-a-job-updateJobPost";
    }

    @PostMapping("/postUpdate/{jobId}")
    @ResponseBody
    public Map<String, Object> updateJobPost (@PathVariable int jobId, @RequestBody JobPostDTO jobPostDTO ) {

        int userNo = (int) sessionUtil.getAttribute("userNo");
        Map<String, Object> map = postService.updateJobPost(userNo, jobPostDTO);
        return map;
    }

    //게시글 삭제
    @GetMapping("/delete")
    public String deleteJobPost(@RequestParam("jobId") int jobId){

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"),"20")) { // 횐원코드 체크
            return "redirect:/";
        }

        postService.deleteJobPost(jobId);
        return "redirect:/business/list";
    }

    @PostMapping("/apply")
    @ResponseBody
    public Map<String, Object> applyJobPost(@RequestBody JobApplicationDTO jobApplicationDTO){
        Map<String, Object> map = postService.applyJobPost(jobApplicationDTO);
        System.out.println("=========================>  map 확인 : "+map);
        return map;
    }

    @PostMapping("/applyCancel")
    @ResponseBody
    public Map<String, Object> applyCancelJob(@RequestBody Integer jobId){
        return postService.applyCancelJob(jobId);
    }
 }
