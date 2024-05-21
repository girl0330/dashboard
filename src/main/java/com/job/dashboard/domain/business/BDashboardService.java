package com.job.dashboard.domain.business;

import java.util.List;
import java.util.Map;

public interface BDashboardService {
    Map<Object, Object> insert(BDashboardDTO dashboardDTO);

    List<BDashboardDTO> findList();

    BDashboardDTO detail(Long id);

    Map<Object, Object> update(BDashboardDTO dashboardDTO);
}
