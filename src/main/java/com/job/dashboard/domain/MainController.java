package com.job.dashboard.domain;

import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class  MainController {
    private final MainService mainService;
    private final SessionUtil sessionUtil;
    private final BusinessDashService businessDashService;

    @GetMapping("/")
    public String mainView(Model model) {
        System.out.println("====메인 페이지====");
        if (sessionUtil.loginUserCheck()) {
            int userNo = (int) sessionUtil.getAttribute("userNo");
            //파일 조회
            FileDTO file = businessDashService.getFile(userNo);
            if (file != null) {
                model.addAttribute("fileId", file.getFileId());
            }
        }

        //hotJobsList
        List<JobPostDTO> likeListUp = mainService.getLikeListUp();
        model.addAttribute("likeListUp",likeListUp);

        //recentJobsList
        List<JobPostDTO> recentListUp = mainService.getRecentListUp();
        model.addAttribute("recentListUp",recentListUp);
        return "jsp/index";
    }

    @GetMapping("/{urlParam}")
    public String pageView(@PathVariable String urlParam) {
        return "jsp/"+urlParam;
    }
}

