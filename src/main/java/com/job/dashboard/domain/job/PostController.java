package com.job.dashboard.domain.job;


import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
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
        System.out.println("====구인공고 작성화면====");

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"),"20")) { // 횐원코드 체크
            return "redirect:/";
        }

        //프로필 작성 확인
        int userNo = (int) sessionUtil.getAttribute("userNo");
        System.out.println("userNo 확인 ::    "+userNo);
        int profileCheck = postService.profileCheck(userNo);
        System.out.println("profileCheck ;;:: "+ profileCheck);
        if (profileCheck == 0) {
            System.out.println("????!!!");
            return "redirect:/business/profile";
        }

        System.out.println("usertypecode가 20임 이제 다음으로 진행하겠음.");
        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/savePost")
    @ResponseBody
    public Map<String, Object> savePost (@RequestBody JobPostDTO jobPostDTO) {
        System.out.println("====공고 저장====");
        Map<String, Object> map = new HashMap<>();

         //로그인한 id를 직접 넣을거임
        map = postService.saveJob(jobPostDTO);
        System.out.println("map/::::::::::   "+ map);
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
        List<LikeDTO> likeList = postService.likeList();
        System.out.println("likeList::::    "+likeList);

        Map<String, Object> response = new HashMap<>();
        response.put("list", jobList.getList());
        response.put("likeList", likeList);
        response.put("total", jobList.getTotal());
        response.put("pageNum", jobList.getPageNum());
        response.put("pageSize", jobList.getPageSize());
        response.put("pages", jobList.getPages());

        System.out.println("response:::::    "+response);
        return response;
    }


    //공고 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam("jobId") int jobId, Model model) {
        System.out.println("====상세페이지 ====");
        System.out.println("jobId??? "+ jobId);
        Map<String, Object> map = new HashMap<>();

        if (sessionUtil.loginUserCheck()) { // 로그인시
            System.out.println("로그인 됨.");
            int userNo = (int) sessionUtil.getAttribute("userNo");
            System.out.println("유저no확인 ; "+userNo);

            map.put("userNo", userNo);
            map.put("jobId", jobId);
            System.out.println("map 내용확인 : "+map);

            int like = postService.findLike(map);
            System.out.println("like ;; "+like);

            model.addAttribute("like", like);
        }

        JobPostDTO detail = postService.detail(jobId);
        System.out.println("detail?? "+detail);

        model.addAttribute("detail",detail);
        return "jsp/post/job-detail";
    }

    //좋아요 관리
    @PostMapping("/like/{jobId}")
    @ResponseBody
    public Map<String, Object> likeCon(@PathVariable int jobId) {
        System.out.println("jobId확인 :: "+jobId);

        Map<String, Object> map = postService.likeCon(jobId);
        System.out.println("likeMap :::   "+ map);
        return map;
    }

    //공고 수정
    @GetMapping("/update")
    public String update(@RequestParam("jobId") int jobId, Model model) {
        System.out.println("수정하기 : id 확인"+jobId);
        int userNo = (int) sessionUtil.getAttribute("userNo"); //로그인한 userNo 가져옴

        JobPostDTO initialData = postService.detail(jobId);
        if (initialData.getUserNo() != userNo) {
            System.out.println("작성회원 불일치");
            return "redirect:/";
        }

        List<SelectBoxOptionDTO> jobType = commonService.getSelectBoxOption("job_type");
        List<SelectBoxOptionDTO> salaryType = commonService.getSelectBoxOption("salary_type");
        List<SelectBoxOptionDTO> employmentType = commonService.getSelectBoxOption("employment_type");
        List<SelectBoxOptionDTO> jobDayType = commonService.getSelectBoxOption("job_day_type");
        List<SelectBoxOptionDTO> statusType = commonService.getSelectBoxOption("status_type");

        model.addAttribute("jobType",jobType);
        model.addAttribute("salaryType",salaryType);
        model.addAttribute("employmentType",employmentType);
        model.addAttribute("jobDayType",jobDayType);
        model.addAttribute("statusType",statusType);
        model.addAttribute("initialData",initialData);

        return "jsp/post/post-a-job-update";
    }

    @PostMapping("/postUpdate/{jobId}")
    @ResponseBody
    public Map<String, Object> updatePost (@PathVariable int jobId, @RequestBody JobPostDTO jobPostDTO ) {
        System.out.println("일단 데이터 확인부터..? "+jobId);

        int userNo = (int) sessionUtil.getAttribute("userNo");
        System.out.println("userNo 확인  ; "+userNo);
        System.out.println("일단 데이터 확인부터..? "+jobPostDTO);
        Map<String, Object> map = postService.update(userNo, jobPostDTO);
        System.out.println(map);
        return map;
    }

    //게시글 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("jobId") int jobId){
        System.out.println("삭제");

        System.out.println("jsp에서 가져온 jobId : "+jobId);

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            return "redirect:/user/login";
        }

        if (!Objects.equals(sessionUtil.getAttribute("userTypeCode"),"20")) { // 횐원코드 체크
            return "redirect:/";
        }

        postService.delete(jobId);
        return "redirect:/business/list";
    }

    @PostMapping("/apply")
    @ResponseBody
    public Map<String, Object> applyJob(@RequestBody JobApplicationDTO jobApplicationDTO){
        System.out.println("지원하기::"+jobApplicationDTO);
        Map<String, Object> map = postService.applyJob(jobApplicationDTO);
        System.out.println("=========================>  map 확인 : "+map);
        return map;
    }

    @PostMapping("/applyCancel")
    @ResponseBody
    public Map<String, Object> applyCancelJob(@RequestBody Integer jobId){
        System.out.println("지원취소하기::");
        Map<String, Object> map = postService.applyCancelJob(jobId);
        System.out.println("=========================>  map 확인 : "+map);
        return map;
    }
 }
