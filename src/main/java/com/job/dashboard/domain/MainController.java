package com.job.dashboard.domain;

import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.file.FileService;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class  MainController {
    private final MainService mainService;
    private final SessionUtil sessionUtil;
    private final BusinessDashService businessDashService;
    private final FileService fileService;

    /**
     * 메인 페이지
     * @param model
     * @return
     */
    @GetMapping("/")
    public String mainView(Model model) {

        //로그인한 회원 정보
        if (sessionUtil.loginUserCheck()) {
            int userNo = (int) sessionUtil.getAttribute("userNo");
            //프로필 이미지 가져오기
            FileDTO file = fileService.getFile(userNo);
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

    @GetMapping("/ajax/getNumberCount")
    public ResponseEntity<?> getNumberCount() {
        ApiResponse response = mainService.getNumberCount();
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{urlParam}")
    public String pageView(@PathVariable String urlParam) {
        return "jsp/"+urlParam;
    }
}

