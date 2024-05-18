package com.job.dashboard.domain.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    int idCheck(MemberDTO memberDTO);

    int emailCheck(MemberDTO memberDTO);

    int businessNumCheck(MemberDTO memberDTO);

    void insert(MemberDTO memberDTO);

    String getHashedPassword(String id);

    MemberDTO selectMemberInfo(MemberDTO memberDTO);
}
