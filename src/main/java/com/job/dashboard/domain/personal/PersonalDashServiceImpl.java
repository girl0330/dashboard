package com.job.dashboard.domain.personal;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.business.BusinessDashService;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PersonalDashServiceImpl implements PersonalDashService {
    private final PersonalDashMapper personalDashMapper;
    private final SessionUtil sessionUtil;
    private final BusinessDashService businessDashService;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //작성된 프로필 확인
    public UserProfileInfoDTO getProfileInfo(int userNo) {
        return personalDashMapper.getProfileInfo(userNo);
    }

    // 프로필 저장하기
    @Transactional
    public Map<Object, String> insertProfile(UserProfileInfoDTO userProfileInfoDTO) throws IOException {

        Map<Object, String> map = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        List<UserProfileInfoDTO> profile = personalDashMapper.profileInfoList(userNo); //userNo로 프로필 존재 확인

        int personalProfile = profile.size();

        if (personalProfile == 0) { //프로필 없으면
            int profileSeq = personalDashMapper.getProfileIdSeq(userNo); //pk
            userProfileInfoDTO.setProfileId(profileSeq);

        } else { //프로필 있으면
            userProfileInfoDTO.setProfileId(profile.get(0).getProfileId()); //pk
        }
        userProfileInfoDTO.setUserNo(userNo);

        //기존 프로필에 파일이 저장 되어 있는지 확인
        Optional.ofNullable(userProfileInfoDTO.getFile())
                .ifPresent(file -> businessDashService.deleteFile(userProfileInfoDTO.getFileId()));

        // 파일 저장
        if (userProfileInfoDTO.getFile() != null) {
            businessDashService.saveFile(userProfileInfoDTO.getFile()); // 파일 저장 됨.
        }

        // systemRegisterId, systemUpdaterId 데이터는?? //pk가 없으면 insert 있으면 updateJobPost
        personalDashMapper.insertProfile(userProfileInfoDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    // 비밀번호 업데이트
    public Map<Object, Object> changePassword(UserDTO userDTO) {
        Map<Object, Object> map = new HashMap<>();

        String enteredPassword = userDTO.getPassword();

        int userNo = userDTO.getUserNo();
        String oldPassword = personalDashMapper.getOldPassword(userNo).getPassword();

        boolean pwCheck = passwordEncoder.matches(enteredPassword, oldPassword);
        if (!pwCheck) {
            throw new CustomException(ExceptionErrorCode.PASSWORD_MISMATCH_TOKEN);
        }

        if (!userDTO.getNewPassword().equals(userDTO.getPassword2())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }

        // 새 비밀번호 암호화
        String encodedNewPassword = passwordEncoder.encode(userDTO.getNewPassword());


        userDTO.setPassword(encodedNewPassword);
        personalDashMapper.updatePassword(userDTO);
        map.put("code", "success");
        map.put("message", "비밀번호 변경 성공");

        return map;
    }

    //지원형황 리스트
    public PageInfo<JobApplicationDTO> applyStatusList(String keyword, int pageNum, int pageSize) {

        Map<String, Object> map = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> applyStatusList = personalDashMapper.applyStatusList(map) ;

        return new PageInfo<>(applyStatusList);
    }

    //dashboard list
    public PageInfo<JobApplicationDTO> getDashboardList(String keyword, int pageNum, int pageSize) {

        Map<String, Object> map = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> dashboardList = personalDashMapper.getDashboardList(map) ;
        return new PageInfo<>(dashboardList);
    }

    //졸아요 리스트
    public PageInfo<JobPostDTO> likedJobsList(String keyword, int pageNum, int pageSize) {

        Map<String, Object> map = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo"); //로그인 정보

        map.put("userNo", userNo);
        map.put("keyword", keyword);

        PageHelper.startPage(pageNum, pageSize);
        List<JobPostDTO> likedJobsList = personalDashMapper.getLikeJobsList(map);
        return new PageInfo<>(likedJobsList);
    }

    public int profileCountByUserNo(int userNo) {
        return personalDashMapper.profileCountByUserNo(userNo);
    }

}
