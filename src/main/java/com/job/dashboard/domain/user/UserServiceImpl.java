package com.job.dashboard.domain.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
}
