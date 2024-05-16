package com.job.dashboard.domain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {
    @GetMapping("/")
    public String mainView() {
        System.out.println("====메인 페이지====");
        return "jsp/index";
    }

    @GetMapping("/{urlParam}")
    public String pageView(@PathVariable String urlParam) {
        return "jsp/"+urlParam;
    }
}

