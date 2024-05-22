package com.job.dashboard.domain.business;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

public interface BDashboardService {
    Map<Object, Object> insert(BDashboardDTO dashboardDTO);

    List<BDashboardDTO> findList();

    BDashboardDTO detail(Long id);

    Map<Object, Object> update(BDashboardDTO dashboardDTO);


    List<String> getSiGroupCode(String si);


    List<String> getGunGroupCode(String gun);

    List<String> getGuGroupCode(String gu);
}
