package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;

import java.util.List;
import java.util.Map;

public interface BusinessDashService {
    //공고 리스트
    List PostList(Integer userNo);

    //기업 프로필 작성
    Map<Object, String> saveProfile(BusinessDashDTO businessDashDTO);
}
