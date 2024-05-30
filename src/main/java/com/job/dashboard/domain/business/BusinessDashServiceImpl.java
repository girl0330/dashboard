package com.job.dashboard.domain.business;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;

    public List PostList(Integer userNo) {
        System.out.println("공고 리스트 임플=====");
        return businessDashMapper.postList(userNo);
    }
}
