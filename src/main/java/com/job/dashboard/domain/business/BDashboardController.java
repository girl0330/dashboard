package com.job.dashboard.domain.business;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BDashboardController {
    private final BDashboardService bDashboardService;

    @GetMapping("/postAJob")
    public String view() {
        System.out.println("====구인공고====");
        return "jsp/business/post-a-job";
    }

    @PostMapping("/postAJob")
    public Map<Object, Object> jobPost(BDashboardDTO dashboardDTO){
        System.out.println("====구인공고 입력====");
        return null;
    }
}
