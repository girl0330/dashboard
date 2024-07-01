package com.job.dashboard.domain.common;

import com.job.dashboard.domain.dto.SelectBoxOptionDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("/common")
public class CommonController {

    private final CommonService commonService;

    @GetMapping("/getSelectBoxOption")
    @ResponseBody
    public Map<String, List<SelectBoxOptionDTO>> getSelectBoxOption(@RequestParam List<String> groupCodes) {
        System.out.println("groupCodes:::::::      "+groupCodes);
        return groupCodes.stream()
                .collect(Collectors.toMap(
                        groupCode -> groupCode,
                        groupCode -> commonService.getSelectBoxOption(groupCode)
                ));
    }
}
