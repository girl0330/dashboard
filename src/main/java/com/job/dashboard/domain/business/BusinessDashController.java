package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BusinessDashController {
    private final BusinessDashService businessDashService;

    //공고 페이지
    @GetMapping("/postAJob")
    public String postAJobView(HttpSession session) {
        System.out.println("====구인공고 작성화면====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId::::;     "+userId);
        if (userId == null) {
            return "redirect:/user/login";
        }
        String userTypeCode = (String) session.getAttribute("userTypeCode");
        System.out.println("user type code확인 : "+userTypeCode);
        if (!"20".equals(userTypeCode)) {
            System.out.println("20이 아니라 10임");
            return "redirect:/";
        }
        System.out.println("usertypecode가 20임 이제 다음으로 진행하겠음.");
        return "jsp/post/post-a-job";
    }

    //공고 작성
    @PostMapping("/savePost")
    @ResponseBody
    public Map<Object, Object> savePost (@RequestBody JobPostDTO jobPostDTO, HttpSession session) {
        System.out.println("====공고 저장====");
        Integer userId = (Integer) session.getAttribute("userId");
        Map<Object, Object> map = businessDashService.saveJob(jobPostDTO,userId);
        System.out.println("map/::::::::::   "+ map);
        return map;
    }

    //공고 리스트
    @GetMapping("/list")
    public String jobPostList(Model model) {
        System.out.println("====잡리스느====");
        List<JobPostDTO> jobList = businessDashService.jobList();
        System.out.println("list확인해봅니다. --->"+ jobList);
        model.addAttribute("jobList",jobList);
        return "jsp/post/job-list";
    }

    //공고 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam("jobId") int id, Model model) {
        System.out.println("====상세페이지 ====");
        JobPostDTO detail = businessDashService.detail(id);
        System.out.println("detail?? "+detail);
        model.addAttribute("detail",detail);
        return "jsp/post/job-detail";
    }

    //공고 수정
    /*post페이지에서 수정
    * post페이지에 내가 전에 작성했던 데이터들이 들어있어야 함.
    *   해당 게시물id를 가져온다.
    *   게시물id로 게시물 데이터를 조회한다. -> dto에 담는다.
    *   담긴 dto를 model로 post 페이지에 뿌린다.
    * 데이터를 수정하고난 후 저장 버튼을 누르면 update쿼리 실행할 거야
    *   수정 버튼을 누르면 수정된 데이터를 controller에서 받는다.
    *   데이터를 update쿼리로 수정한다.
    * */
    @GetMapping("/update")
    public String update(@RequestParam("jobId") int id, Model model) {
        System.out.println("수정하기 : id 확인"+id);
        JobPostDTO old = businessDashService.detail(id);
        System.out.println("old확인 : "+old);
        model.addAttribute("old",old);
        return "jsp/post/post-a-job-update";
    }

    @PostMapping("/postUpdate/{jobId}")
    @ResponseBody
    public Map<Object, Object> updatePost (@PathVariable int jobId, @RequestBody JobPostDTO jobPostDTO) {
        System.out.println("일단 데이터 확인부터..? "+jobId);
        System.out.println("일단 데이터 확인부터..? "+jobPostDTO);
        Map<Object, Object> map = businessDashService.update(jobId, jobPostDTO);
        System.out.println(map);
        return map;
    }

    //게시글 삭제
    @GetMapping("/delete")
    public Map<Object, Object> delete (HttpSession session, @RequestParam("jobId") int id) {
        System.out.println("삭제합니다~");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("session 에서 가져온 id " + userId);
        System.out.println("jsp에서 가져온 id : "+id);
//        Map<Object, Object> map = businessDashService.delete();
        return null;
    }

 }
