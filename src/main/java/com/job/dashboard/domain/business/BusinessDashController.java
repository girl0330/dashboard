package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BusinessDashController {
    private final BusinessDashService businessDashService;

    @GetMapping("/postAJob")
    public String postAJobView(HttpSession session) {
        System.out.println("====구인공고 작성화면====");
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId::::;     "+userId);
        if (userId == null) {
            return "redirect:/user/login";
        }
        return "jsp/post/post-a-job";
    }

    @PostMapping("/savePost")
    @ResponseBody
    public Map<Object, Object> savePost (@RequestBody JobPostDTO jobPostDTO) {
        System.out.println("====공고 저장====");
        Map<Object, Object> map = businessDashService.saveJob(jobPostDTO);
        System.out.println("map/::::::::::   "+ map);
        return map;
    }
 }
