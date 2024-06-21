package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PersonalDashServiceImpl implements PersonalDashService {
    private final PersonalDashMapper personalDashMapper;
    private final SessionUtil sessionUtil;
    private final BusinessDashService businessDashService;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //프로필이 작성 유무
    public int profileCheck(int userNo) {
        System.out.println("프로필 유무 체크");

        return personalDashMapper.profileCheck(userNo);
    }

    // 기존 작성된 프로필 가져오기
    public UserProfileInfoDTO getProfile(Integer userNo) {
        System.out.println("====피로필 impl");
        UserProfileInfoDTO profile = personalDashMapper.getProfile(userNo);
        System.out.println("profile;;;;::::   " + profile);
        return profile;
    }

    // 프로필 저장하기
    @Transactional
    public Map<Object, String> saveProfile(UserProfileInfoDTO userProfileInfoDTO) throws IOException {
        System.out.println("======profileSave === impl====");

        Map<Object, String> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        List<UserProfileInfoDTO> profile = personalDashMapper.checkProfile(userNo); //userNo를 가지고 프로필 존재 확인

        int personalProfile = profile.size();

        if (personalProfile == 0) { //프로필 작성이 안 되어있으면..
            int profileSeq = personalDashMapper.getProfileIdSeq(userNo);
            userProfileInfoDTO.setProfileId(profileSeq);

        } else { //프로필 작성이 되어 있으면..
            userProfileInfoDTO.setProfileId(profile.get(0).getProfileId());
        }
        userProfileInfoDTO.setUserNo(userNo);

        System.out.println("file?"+userProfileInfoDTO.getFile());
        // 파일 저장
        if (userProfileInfoDTO.getFile() != null) {
            Map<Object, String> fileResult = businessDashService.saveFile(userProfileInfoDTO.getFile());
            System.out.println("====================fileResult 는 :"+fileResult); // 파일 저장 됨.
        }

        // systemRegisterId, systemUpdaterId 데이터는?? //pk가 없으면 insert 있으면 update
        System.out.println("userProfileDTO"+userProfileInfoDTO);
        personalDashMapper.saveProfile(userProfileInfoDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    //

    // 비밀번호 업데이트
    public Map<Object, Object> changePassword(UserDTO userDTO) {
        System.out.println("비번 업뎃 임플");
        Map<Object, Object> map = new HashMap<>();

        String enteredPassword = userDTO.getPassword();
        System.out.println("입력한 비밀번호 : " + enteredPassword);

        int userNo = userDTO.getUserNo();
        /*  UserDTO oldPassword = personalDashMapper.getOldPassword(userNo);
        * String password = oldPassword.getPassword();*/
        String oldPassword = personalDashMapper.getOldPassword(userNo).getPassword();
        System.out.println("이전 비번 :: " + oldPassword);

        boolean pwCheck = passwordEncoder.matches(enteredPassword, oldPassword);
        System.out.println("비밀번호 서로 맞는지 확인: " + pwCheck);
        if (!pwCheck) {
            map.put("code", "existError");
            map.put("message", "입력한 비밀번호가 존재하지 않습니다.");
            return map;
        }

        System.out.println("userNewPassword 확ㅇ니 :: " + userDTO.getNewPassword());

        System.out.println("userDto 확ㅇ니::: " + userDTO);
        if (!userDTO.getNewPassword().equals(userDTO.getPassword2())) {
            System.out.println("불일치");
            map.put("code", "checkError");
            map.put("message", "비밀번호가 일치하지 않습니다.");
            return map;
        }
        System.out.println("일치. ");

        // 새 비밀번호 암호화
        String encodedNewPassword = passwordEncoder.encode(userDTO.getNewPassword());


        userDTO.setPassword(encodedNewPassword);
        personalDashMapper.updatePassword(userDTO);
        System.out.println("update문이 실행??" + userDTO);
        map.put("code", "success");
        map.put("message", "비밀번호 변경 성공");

        return map;
    }

    //지원형황 리스트
    public PageInfo<JobApplicationDTO> applyStatusList(String keyword, int pageNum, int pageSize) {
        System.out.println("현재 지원현황 리스트 임플");

        Map<String, Object> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);
        System.out.println(" map 에 들어간거 확인 :: "+map);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> applyStatusList = personalDashMapper.applyStatusList(map) ;
        return new PageInfo<>(applyStatusList);
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

    //dashboard list
    public PageInfo<JobApplicationDTO> dashboardList(String keyword, int pageNum, int pageSize) {
        System.out.println("최근 지원한 리스트 임플");

        Map<String, Object> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);
        System.out.println("map??:: "+map);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> dashboardList = personalDashMapper.getDashboardList(map) ;
        return new PageInfo<>(dashboardList);
    }

    //졸아요 리스트
    public PageInfo<JobPostDTO> likedJobsList(String keyword, int pageNum, int pageSize) {
        System.out.println("좋아요 리스트 임플");

        Map<String, Object> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo"); //로그인 정보

        map.put("userNo", userNo);
        map.put("keyword", keyword);
        System.out.println("map??:: "+map);

        PageHelper.startPage(pageNum, pageSize);
        List<JobPostDTO> likedJobsList = personalDashMapper.getLikeJobsList(map);
        return new PageInfo<>(likedJobsList);
    }

    public int getCountJobs() {
        return personalDashMapper.getCountJobs();  // 총 게시물 수를 세는 메서드
    }

}
