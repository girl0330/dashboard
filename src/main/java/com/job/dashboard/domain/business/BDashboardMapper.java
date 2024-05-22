package com.job.dashboard.domain.business;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface BDashboardMapper {
    void insert(BDashboardDTO dashboardDTO);

    List<BDashboardDTO> findList();

    BDashboardDTO detail(Long id);

    void update(BDashboardDTO dashboardDTO);

    List<String> getSiGroupCode(@Param("si") String si);

    List<String> getGunGroupCode(@Param("gun")String gun);

    List<String> getGuGroupCode(@Param("gu")String gu);
}
