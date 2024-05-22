package com.job.dashboard.domain.business;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class BDashboardController {
    private final BDashboardService dashboardService;

    @GetMapping("/postAJob")
    public String view() {
        System.out.println("====구인공고====");
        return "jsp/business/post-a-job";
    }

    @PostMapping("/postAJob")
    @ResponseBody
    public Map<Object, Object> jobPost( @RequestBody BDashboardDTO dashboardDTO){
        System.out.println("====구인공고 입력====");
        System.out.println("dto확인:::" +dashboardDTO);
        Map<Object, Object> map = dashboardService.insert(dashboardDTO);
        System.out.println("map???" + map);
        return map;
    }


    @GetMapping("/list")
    public String listView(Model model) {
        System.out.println("====리스트====");
        List<BDashboardDTO> jobList = dashboardService.findList();
        System.out.println("리스트 확인::" + jobList);
        model.addAttribute("jobList", jobList);
        return "jsp/business/job-list";
    }


    @GetMapping("/detail")
    public String detail(@RequestParam("jobPostId") Long id, Model model) {
        System.out.println("====상세페이지====");
        BDashboardDTO detail = dashboardService.detail(id);
        System.out.println("detail:::" + detail);
        model.addAttribute("detail", detail);
        return "jsp/business/job-detail";
    }
    @PostMapping("/update")
    @ResponseBody
    public Map<Object, Object> boardUpdate(BDashboardDTO dashboardDTO) {
        System.out.println("dashboardDTO:::   "+dashboardDTO);
        Map<Object, Object> map = dashboardService.update(dashboardDTO);
        System.out.println("map????"+map);
        return map;
    }


    @GetMapping("/getSiGroup")
    @ResponseBody
    public List<String> getSiGroupCode(@RequestParam(required = false) String si) {
        System.out.println("testttt"+si);
        return dashboardService.getSiGroupCode(si);
    }

    @GetMapping("/getGunGroup")
    @ResponseBody
    public List<String> getGunGroupCode(@RequestParam(required = false) String gun) {
        System.out.println("????"+gun);
        return dashboardService.getGunGroupCode(gun);
    }

    @GetMapping("/getGuGroup")
    @ResponseBody
    public List<String> getGuGroupCode(@RequestParam(required = false) String gu) {
        return dashboardService.getGuGroupCode(gu);
    }
}
