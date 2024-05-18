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

    //개인 로그인
    public Map<Object, Object> personalLogin(MemberDTO memberDTO) {
        System.out.println("====serviceImple====");
        Map<Object, Object> map = new HashMap<>();
        String id = memberDTO.getMemberId();
        String password = memberDTO.getPassword();

        //아이디로 저장된 비밀번호가 있는지 확인
        String hashedPassword = memberMapper.getHashedPassword(id);
        System.out.println("hashedPassword 확인:::"+ hashedPassword);

        if (hashedPassword == null) {
            System.out.println("해당 아이디는 없음");
            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않거나, 일치하지 않습니다.");
            return map;
        }

        //비밀번호 일치확인
        boolean pwCheck = passwordEncoder.matches(password, hashedPassword); // 일치하는지 확인
        System.out.println(pwCheck); // 일치하면 ture 반환
        if (!pwCheck) {
            System.out.println("해당 비밀번호는 없음");
            map.put("code", "error");
            map.put("message", "비밀번호가 존재하지 않거나, 일치하지 않습니다.");
            return map;
        }
        System.out.println("비밀번호가 존재함");
        memberDTO.setPassword(hashedPassword); // 암호화된 비밀번호로 바꿈

        //정보가져오기
        MemberDTO memberInfo = memberMapper.selectMemberInfo(memberDTO);
        System.out.println("selectMemberInfo의 결과:::"+memberInfo);
        map.put("userInfo",memberInfo);
        map.put("code","success");
        map.put("message","로그인 성공!");
        return map;
    }

    //기업 로그인
    public Map<Object, Object> businessLogin(MemberDTO memberDTO) {
        System.out.println("====serviceImple====");
        Map<Object, Object> map = new HashMap<>();
        String id = memberDTO.getMemberId();
        String password = memberDTO.getPassword();

        //아이디로 저장된 비밀번호가 있는지 확인
        String hashedPassword = memberMapper.getHashedPassword(id);
        System.out.println("hashedPassword 확인:::"+ hashedPassword);

        if (hashedPassword == null) {
            System.out.println("해당 아이디는 없음");
            map.put("code", "error");
            map.put("message", "아이디가 존재하지 않거나, 일치하지 않습니다.");
            return map;
        }

        //비밀번호 일치확인
        boolean pwCheck = passwordEncoder.matches(password, hashedPassword); // 일치하는지 확인
        System.out.println(pwCheck); // 일치하면 ture 반환
        if (!pwCheck) {
            System.out.println("해당 비밀번호는 없음");
            map.put("code", "error");
            map.put("message", "비밀번호가 존재하지 않거나, 일치하지 않습니다.");
            return map;
        }
        System.out.println("비밀번호가 존재함");
        memberDTO.setPassword(hashedPassword); // 암호화된 비밀번호로 바꿈

        //정보가져오기
        MemberDTO memberInfo = memberMapper.selectMemberInfo(memberDTO);
        System.out.println("selectMemberInfo의 결과:::"+memberInfo);
        map.put("userInfo",memberInfo);
        map.put("code","success");
        map.put("message","로그인 성공!");
        return map;
    }
}
