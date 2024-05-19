package com.job.dashboard.domain.parsonalDashboard;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PDMapper {
    void saveProfile(Long uuid);
}
