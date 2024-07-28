package com.job.dashboard.domain.common;


import com.job.dashboard.domain.dto.SelectBoxOptionDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService {
    private final CommonMapper commonMapper;


    @Override
    public List<SelectBoxOptionDTO> getSelectBoxOption(String groupCode) {

        List<SelectBoxOptionDTO> options = commonMapper.getSelectBoxOption(groupCode);

        // 리스트의 값을 출력
        for (SelectBoxOptionDTO option : options) {
        }
        return options;
    }
}