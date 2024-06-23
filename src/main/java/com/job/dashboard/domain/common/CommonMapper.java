package com.job.dashboard.domain.common;

import com.job.dashboard.domain.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommonMapper {
    List<SelectBoxOptionDTO> getSelectBoxOption(String groupCode);
}
