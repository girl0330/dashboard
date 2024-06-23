package com.job.dashboard.domain.common;

import com.job.dashboard.domain.dto.SelectBoxOptionDTO;

import java.util.List;

public interface CommonService {
    List<SelectBoxOptionDTO> getSelectBoxOption(String groupCode);
}
