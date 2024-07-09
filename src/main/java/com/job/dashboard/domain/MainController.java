package com.job.dashboard.domain;

import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.FileDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
//private final BusinessDashService businessDashService;

@Controller
public class MainController {
    @GetMapping("/")
    public String mainView(Model model) {
        System.out.println("====메인 페이지====");

//        FileDTO file = businessDashService.getFile(userNo);
//        System.out.println("파일 확인 :::;  "+file);
//        if (file != null) {
//            model.addAttribute("fileId", file.getFileId());
//        }
        return "jsp/index";
    }

    @GetMapping("/{urlParam}")
    public String pageView(@PathVariable String urlParam) {
        return "jsp/"+urlParam;
    }
}

