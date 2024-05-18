package com.job.dashboard.domain.member;

import java.util.Map;

public interface MemberService {
    // 회원가입
    Map<Object, Object> insert(MemberDTO memberDTO);

    Map<Object, Object> insertB(MemberDTO memberDTO);

    Map<Object, Object> personalLogin(MemberDTO memberDTO);

    Map<Object, Object> businessLogin(MemberDTO memberDTO);
}
