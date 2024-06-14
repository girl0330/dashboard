package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.Criteria;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
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

        System.out.println("usertypecode가 20임 이제 다음으로 진행하겠음.");
        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/savePost")
    @ResponseBody
    public Map<String, Object> savePost (@RequestBody JobPostDTO jobPostDTO) {
        System.out.println("====공고 저장====");

         //로그인한 id를 직접 넣을거임
        Map<String, Object> map = postService.saveJob(jobPostDTO);
        System.out.println("map/::::::::::   "+ map);
        return map;
    }

    //공고 리스트
    @GetMapping("/ajax/list")
    @ResponseBody
    public List<JobPostDTO> ajaxCallList(@RequestParam(value = "keyword", required = false) String keyword) {
        System.out.println("====ajax====");
        return postService.keywordJobList(keyword);
    }

//    @GetMapping("/list")
//    public String jobPostList(Model model) {
//        System.out.println("====잡리스느====");
//        List<JobPostDTO> jobList = postService.jobList();
//        model.addAttribute("jobList",jobList);
//        return "jsp/post/job-list";
//    }

//    @GetMapping("/api/job-list")
//    @ResponseBody
//    public List<JobPostDTO> getJobList(@RequestParam(value = "keyword", required = false) String keyword) {
//        System.out.println("????????");
//        if (keyword != null && !keyword.isEmpty()) {
//            return postService.keywordJobList(keyword);
//        }
//        return postService.jobList();
//    }

//    //공고 리스트
//    @GetMapping("/list")
//    public String jobPostList(Model model) {
//        System.out.println("====잡리스느====");
//
//        List<JobPostDTO> jobList = postService.jobList();
//        System.out.println("list확인해봅니다. --->"+ jobList);
//
//        model.addAttribute("jobList",jobList);
//        return "jsp/post/job-list";
//    }
//
//    // 키워드 리스트
//    @GetMapping("/keywordList")
//    @ResponseBody
//    public Map<String, Object> getJobList(@RequestParam(value = "keyword", required = false) String keyword) {
//        System.out.println("keyword 확인 : " + keyword);
//        Map<String, Object> map = new HashMap<>();
//
//        if (keyword == null && keyword.isEmpty()) {
//            map.put("code", "empty");
//            map.put("message","검색어를 입력해주세요");
//            return map;
//        }
//
//        System.out.println("검색어 있음?");
//        System.out.println("keyword :" + keyword);
//
//        List<JobPostDTO> jobList = postService.keywordJobList(keyword);
//        System.out.println("검색한 list  --->"+ jobList);
//        map.put("code", "success");
//        map.put("list", jobList);
////        model.addAttribute("jobList",jobList);
//
//        return map;
//    }

    //공고 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam("jobId") int jobId, Model model) {
        System.out.println("====상세페이지 ====");
        System.out.println("jobId??? "+ jobId);

        JobPostDTO detail = postService.detail(jobId);
        System.out.println("detail?? "+detail);

        model.addAttribute("detail",detail);
        return "jsp/post/job-detail";
    }

    //공고 수정
    @GetMapping("/update")
    public String update(@RequestParam("jobId") int jobId, Model model) {
        System.out.println("수정하기 : id 확인"+jobId);
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo"); //로그인한 userNo 가져옴

        JobPostDTO old = postService.detail(jobId);
        if (old.getUserNo() != userNo) {
            System.out.println("일치안함");
            return "redirect:/";
        }

        System.out.println("일치함");
        System.out.println("old확인 : "+old);
        model.addAttribute("old",old);
        return "jsp/post/post-a-job-update";
    }

    @PostMapping("/postUpdate/{jobId}")
    @ResponseBody
    public Map<String, Object> updatePost (@PathVariable int jobId, @RequestBody JobPostDTO jobPostDTO ) {
        System.out.println("일단 데이터 확인부터..? "+jobId);

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
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

    //페이징 처리
    @GetMapping("/list")
    public String jobPostList(Criteria criteria,Model model) {
        System.out.println("====잡리스느===="+criteria);
        List<JobPostDTO> jobs = postService.getListWithPaging(criteria);
        int totalJobs = postService.getCountJobs();  // 총 게시물 수를 가져오는 메서드
        int totalPages = (int) Math.ceil((double) totalJobs / criteria.getAmount()); // 총 게시물 페이지 메서드

        System.out.println("totalJobs"+totalJobs);
        System.out.println("totalPages"+totalPages);

        model.addAttribute("jobs", jobs);
        model.addAttribute("criteria", criteria);
        model.addAttribute("totalPages", totalPages);
        return "jsp/post/job-list";
    }

//    public String listJobs(Criteria criteria, Model model) {
//        List<JobPostDTO> jobs = postService.getListWithPaging(criteria);
//        int totalJobs = postService.getCountJobs();  // 총 게시물 수를 가져오는 메서드
//        int totalPages = (int) Math.ceil((double) totalJobs / criteria.getAmount());
//
//        model.addAttribute("jobs", jobs);
//        model.addAttribute("criteria", criteria);
//        model.addAttribute("totalPages", totalPages);
//        return "jsp/post/job-list";
//    }
 }
