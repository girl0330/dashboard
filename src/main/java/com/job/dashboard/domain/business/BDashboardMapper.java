package com.job.dashboard.domain.business;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BDashboardMapper {
    void insert(BDashboardDTO dashboardDTO);

    List<BDashboardDTO> findList();

    BDashboardDTO detail(Long id);

    void update(BDashboardDTO dashboardDTO);
}
