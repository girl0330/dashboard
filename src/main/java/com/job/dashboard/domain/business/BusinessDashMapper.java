package com.job.dashboard.domain.business;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BusinessDashMapper {
    List postList(int userNo);
}
