package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import com.job.dashboard.domain.dto.UserDTO;
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
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //프로필이 작성 유무
    public Boolean profileCheck(Integer userId) {
        System.out.println("프로필 유무 체크");
        boolean profileCheck;
        int x = personalDashMapper.profileCheck(userId);
        System.out.println("x ::::   " + x);
        profileCheck = x > 0;

        return profileCheck;
    }

    // 기존 작성된 프로필 가져오기
    public PersonalDashDTO getProfile(Integer userId) {
        System.out.println("====피로필 impl");
        PersonalDashDTO profile = personalDashMapper.getProfile(userId);
        System.out.println("profile;;;;::::   " + profile);
        return profile;
    }

    // 프로필 저장하기
    @Transactional
    public Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO, HttpSession session) {
        System.out.println("======profileSave === impl====");
        Map<Object, String> map = new HashMap<>();
        int userId = personalDashDTO.getUserId();
//        int userId = (int)session.getAttribute("userId");
        System.out.println(userId + "            userId 확인해볼게요  ");
        List<PersonalDashDTO> profile = personalDashMapper.checkProfile(userId); //userId를 가지고 프로필 존재 확인
        System.out.println("checkPfofile------>>     " + profile);

        int x = profile.size();

        if (x == 0) {
            int profileSeq = personalDashMapper.getProfileIdSeq(userId);
            System.out.println("profileSeq????? " + profileSeq + "                      <<<<<<<<<<");
            personalDashDTO.setProfileId(profileSeq);
            System.out.println("personalDto 확인해봅시다...........   " + personalDashDTO);
        } else {
            personalDashDTO.setProfileId(profile.get(0).getProfileId());
        }
        personalDashDTO.setUserId(userId);

        //pk가 없으면 insert 있으면 update
        personalDashMapper.saveProfile(personalDashDTO);


        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    // 비밀번호 업데이트
    /*비밀번호 업데이트 하려면
     * 1. 내가 입력한 현재비밀번호와 저장된 내 비밀 번호가 일치 하는가?
     *       입력한 dto에 같이 전달해준 userid를 저장해서
     *       서비스에서 저장된 id로 일치한 user정보를 저장
     *       저장한 해시비밀번호를 따로 가져옴
     *       가져온 해시비밀번호와 내가 입력한 비밀번호가 일치하는지 확인
     * 2. 새로운 비밀번호와 새로운 비밀번호 재입력한 비밀번호가 일치하는가?
     * 3. 변경한 비밀번호 해시코드로 변환
     *       변환한 비밀번호 update쿼리로 저장
     * */
    public Map<Object, Object> changePassword(UserDTO userDTO) {
        System.out.println("비번 업뎃 임플");
        Map<Object, Object> map = new HashMap<>();
        String enteredPassword = userDTO.getPassword();
        System.out.println("입력한 비밀번호 : " + enteredPassword);
        int userId = userDTO.getUserId();
        String getPassword = personalDashMapper.getOldPassword(userId).getPassword();
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
//        userDTO.setPassword(encodedNewPassword);
//        System.out.println("변경된 password확인 해보자 :: "+encodedNewPassword);
//
//        System.out.println("변경된 비밀번호 DTO에 넣은것까지 했으니까 확인해보자. :: " + userDTO);
        System.out.println("update문이 실행이 잘 됐나??" + userDTO);
        map.put("code", "success");
        map.put("message", "비밀번호 변경 성공");

        return map;
    }

    //지원형황 리스트
    public List<JobApplicationDTO> applyList(Integer userId) {
        System.out.println("지원현황 리스트 임플");
        return personalDashMapper.applyList(userId);
    }

    //지원 리스트 삭제
    public Map<String, Object> applyListDelete(int applicationId) {
        System.out.println("지원 리스트 삭제");
        Map<String, Object> map = new HashMap<>();
        personalDashMapper.applyListDelete(applicationId);
        map.put("code", "success");
        map.put("message", "지원 리스트 삭제 완료!");
        return map;
    }

//    //지원 리스트 보기
//    public JobPostDTO postDetailView(int jobId) {
//        JobPostDTO jobPostDTO = new JobPostDTO();
//        JobPostDTO postFind = personalDashMapper.postFind(jobId);
//    }
//    public Map<String, Object> applyListLook(int applicationId) {
//
//        System.out.println("지원 리스트 보기");
//        Map<String, Object> map = new HashMap<>();
//        personalDashMapper.applyListDelete(applicationId);
//        map.put("code", "success");
//        map.put("message", "지원 리스트 삭제 완료!");
//        return map;
//    }
}
