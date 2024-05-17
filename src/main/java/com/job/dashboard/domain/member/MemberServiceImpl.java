package com.job.dashboard.domain.member;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // 개인 회원가입
    public Map<Object, Object> insert (MemberDTO memberDTO) {
        System.out.println("====serviceImpl====");
        Map<Object, Object> map = new HashMap<>();

        //아이디 중복체크
        int idCheck = memberMapper.idCheck(memberDTO);

        if (idCheck > 0) {
            map.put("code", "error");
            map.put("message", "이미 사용중인 아이디 입니다.");
            return map;
        }
        System.out.println("아이디");
        //이메일 중복체크
        int emailCheck = memberMapper.emailCheck(memberDTO);

        if (emailCheck > 0) {
            map.put("code","error");
            map.put("message","이미 등록된 이메일 입니다.");
            return map;
        }
        System.out.println("이메일");

        //비밀번호1, 2 동일체크
        if(!memberDTO.getPassword().equals(memberDTO.getPassword2())) {
            map.put("code", "error");
            map.put("message", "비밀번호가 일치하지 않습니다.");
            return map;
        }
        System.out.println("비밀번호 동일체크");
        //비밀번호 인코딩
        String encodedPassword = passwordEncoder.encode(memberDTO.getPassword());
        System.out.println("인코딩된 비밀번호 확인"+encodedPassword);

        //계정등록
        memberDTO.setRegistrarId(memberDTO.getMemberId());
        memberDTO.setPassword(encodedPassword);
        memberMapper.insert(memberDTO);
        map.put("code","success");
        map.put("message","회원가입성공");
        System.out.println("계정등록");
        return map;
    }

    //기업 회원가입
    public Map<Object, Object> insertB(MemberDTO memberDTO) {
        System.out.println("====serviceImplB====");
        Map<Object, Object> map = new HashMap<>();

        //아이디 중복체크
        int idCheck = memberMapper.idCheck(memberDTO);

        if (idCheck > 0) {
            map.put("code", "error");
            map.put("message", "이미 사용중인 아이디 입니다.");
            return map;
        }
        System.out.println("아이디");
        //이메일 중복체크
        int emailCheck = memberMapper.emailCheck(memberDTO);

        if (emailCheck > 0) {
            map.put("code","error");
            map.put("message","이미 등록된 이메일 입니다.");
            return map;
        }
        System.out.println("이메일");
        //사업자번호 중복체크

        System.out.println("사업자 번호는?????"+memberDTO.getBusinessRegistrationNumber());
        int businessNumCheck = memberMapper.businessNumCheck(memberDTO);
        if (businessNumCheck > 0) {
            map.put("code", "error");
            map.put("message", "이미 등록된 사업자 번호입니다.");
            return map;
        }
        System.out.println("사업자번호");

        //비밀번호1, 2 동일체크
        if(!memberDTO.getPassword().equals(memberDTO.getPassword2())) {
            map.put("code", "error");
            map.put("message", "비밀번호가 일치하지 않습니다.");
            return map;
        }
        System.out.println("비밀번호 동일체크");
        //비밀번호 인코딩
        String encodedPassword = passwordEncoder.encode(memberDTO.getPassword());
        System.out.println("인코딩된 비밀번호 확인"+encodedPassword);

        //계정등록
        memberDTO.setPassword(encodedPassword);
        memberDTO.setRegistrarId(memberDTO.getMemberId());
        memberMapper.insert(memberDTO);
        map.put("code","success");
        map.put("message","회원가입성공");
        System.out.println("계정등록");
        return map;
    }
}
