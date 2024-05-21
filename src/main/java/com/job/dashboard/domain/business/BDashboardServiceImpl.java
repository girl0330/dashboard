package com.job.dashboard.domain.business;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BDashboardServiceImpl implements BDashboardService{
    private final BDashboardMapper dashboardMapper;

    public Map<Object, Object> insert(BDashboardDTO dashboardDTO){
        System.out.println("====작성impl실행 ====");
        Map<Object,Object> map = new HashMap<>();

        dashboardMapper.insert(dashboardDTO);
        map.put("code","success");
        map.put("message","게시글 작성 성공");
        System.out.println("게시글 등록 성공");
        return map;
    }

    public  List<BDashboardDTO> findList() {
        System.out.println("====목록 impl실행 ====");
        return dashboardMapper.findList();
    }

    public BDashboardDTO detail(Long id) {
        System.out.println("====자세히 보기 impl실행 ====");
        return dashboardMapper.detail(id);
    }

    public Map<Object, Object> update(BDashboardDTO dashboardDTO) {
        System.out.println("====수정 impl실행 ====");
        Map<Object,Object> map = new HashMap<>();

        dashboardMapper.update(dashboardDTO);
        map.put("code","success");
        map.put("message","게시글 작성 성공");
        System.out.println("게시글 등록 성공");
        return map;
    }
}
