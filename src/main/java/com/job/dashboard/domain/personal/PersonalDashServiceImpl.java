package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class PersonalDashServiceImpl implements PersonalDashService {
    private final PersonalDashMapper personalDashMapper;
    private final SessionUtil sessionUtil;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //프로필이 작성 유무
    public Boolean profileCheck(Integer userNo) {
        System.out.println("프로필 유무 체크");
        boolean profileCheck;
        int x = personalDashMapper.profileCheck(userNo);
        System.out.println("x ::::   " + x);
        profileCheck = x > 0;

        return profileCheck;
    }

    // 기존 작성된 프로필 가져오기
    public PersonalDashDTO getProfile(Integer userNo) {
        System.out.println("====피로필 impl");
        PersonalDashDTO profile = personalDashMapper.getProfile(userNo);
        System.out.println("profile;;;;::::   " + profile);
        return profile;
    }

    // 프로필 저장하기
    @Transactional
    public Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO) {
        System.out.println("======profileSave === impl====");

        Map<Object, String> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        List<PersonalDashDTO> profile = personalDashMapper.checkProfile(userNo); //userNo를 가지고 프로필 존재 확인
        System.out.println("checkPfofile------>>     " + profile);

        int x = profile.size();

        if (x == 0) {
            int profileSeq = personalDashMapper.getProfileIdSeq(userNo);
            System.out.println("profileSeq????? " + profileSeq + "                      <<<<<<<<<<");
            personalDashDTO.setProfileId(profileSeq);
            System.out.println("personalDto 확인해봅시다...........   " + personalDashDTO);
        } else {
            personalDashDTO.setProfileId(profile.get(0).getProfileId());
        }
        personalDashDTO.setUserNo(userNo);

        // systemRegisterId, systemUpdaterId 데이터는?? //pk가 없으면 insert 있으면 update
        personalDashMapper.saveProfile(personalDashDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");
        map.put("coed","update");
        map.put("message", "프로필 업데이트 성공!");

        return map;
    }

    // 비밀번호 업데이트
    public Map<Object, Object> changePassword(UserDTO userDTO) {
        System.out.println("비번 업뎃 임플");
        Map<Object, Object> map = new HashMap<>();

        String enteredPassword = userDTO.getPassword();
        System.out.println("입력한 비밀번호 : " + enteredPassword);

        int userNo = userDTO.getUserNo();
        String getPassword = personalDashMapper.getOldPassword(userNo).getPassword();
        System.out.println("입력되어 있었던 비번 :: " + getPassword);

        boolean pwCheck = passwordEncoder.matches(enteredPassword, getPassword);
        System.out.println("비밀번호 서로 맞는지 확인: " + pwCheck);
        if (!pwCheck) {
            map.put("code", "error");
            map.put("message", "비밀번호가 존재하지 않습니다.");
            return map;
        }

        System.out.println("userDto 확ㅇ니::: " + userDTO);
        if (!userDTO.getNewPassword().equals(userDTO.getPassword2())) {
            System.out.println("서로 일치 않아잖아~~~!!!!!");
            map.put("code", "error");
            map.put("message", "비밀번호가 일치하지 않습니다.");
            return map;
        }
        System.out.println("새로 만든 비밀번호가 동일함. ");

        System.out.println("userNewPassword 확ㅇ니 :: " + userDTO.getNewPassword());
        String encodedNewPassword = passwordEncoder.encode(userDTO.getNewPassword());

        userDTO.setPassword(encodedNewPassword);
        personalDashMapper.updatePassword(userDTO);
        System.out.println("update문이 실행이 잘 됐나??" + userDTO);
        map.put("code", "success");
        map.put("message", "비밀번호 변경 성공");

        return map;
    }

    //지원형황 리스트
    public List<JobApplicationDTO> applyList() {
        System.out.println("지원현황 리스트 임플");
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        return personalDashMapper.applyList(userNo);
    }

    //지원 리스트 삭제 (취소, statusTypeCode를 취소로 바꾸기)
    public Map<String, Object> applyListDelete(int applicationId) {
        System.out.println("지원 리스트 삭제");
        Map<String, Object> map = new HashMap<>();

        personalDashMapper.applyListCancel(applicationId);
        map.put("code", "success");
        map.put("message", "공고 지원이 취소 되었습니다.");
        return map;
    }

    //지원 리스트 보기
    public List<JobApplicationDTO> applyJobList(Integer userNo) {
        System.out.println("지원한 리스트 임플");
        return personalDashMapper.getApplyJobList(userNo);
    }
}
