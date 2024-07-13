package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //이메일 중복인가 확인
    public Map<String, Object> emailDuplicateCheck(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();

        int email = userMapper.getEmailCount(userDTO);
        if (email > 0) { // 동일한 이메일이 있다면
            throw new CustomException(ExceptionErrorCode.EMAIL_ALREADY_IN_USE_TOKEN);
        }

        map.put("code", "success");
        map.put("message","사용가능한 이에일 입니다.");
        return map;
    }

    // 회원가입
    public Map<String, Object> insertUser(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();

        //이메일 중복 체크
        int email = userMapper.getEmailCount(userDTO);

        if (email > 0) { // 동일한 이메일이 있다면
            throw new CustomException(ExceptionErrorCode.EMAIL_ALREADY_IN_USE_TOKEN);
        }

        //비밀번호 1,2 동일 체크
        if (!Objects.equals(userDTO.getPassword(), userDTO.getPassword2())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }

        //비밀번호 인코딩
        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());

        userDTO.setPassword(encodedPassword);

        userMapper.insertUser(userDTO);
        map.put("code", "success");
        map.put("message","회원가입성공");

        return map;
    }

    //로그인
    public  Map<String, Object> doLogin(UserDTO userDTO) {
        Map<String, Object> map = new HashMap<>();
        String email = userDTO.getEmail();
        String password = userDTO.getPassword();
        String enteredUserTypeCode = userDTO.getUserTypeCode();

        //이메일이 있는지 확인
        String hashedPassword = userMapper.getHashedPassword(email);

        if (hashedPassword == null) {
            throw new CustomException(ExceptionErrorCode.MEMBER_NOT_FOUND_TOKEN);
        }

        //비밀번호 존재하는지, 일치하는지 확인
        boolean pwCheck = passwordEncoder.matches(password, hashedPassword); // 일치하는지 확인
        if (!pwCheck) {
            throw new CustomException(ExceptionErrorCode.PASSWORD_INCORRECT_TOKEN);
        }

        userDTO.setPassword(hashedPassword);

        //타입코드가 맞는지 확인
        String getUserTypeCode = userMapper.getUserTypeCode(email);
        if (!Objects.equals(getUserTypeCode, enteredUserTypeCode)) {
            throw new CustomException(ExceptionErrorCode.USER_TYPE_CODE_MISMATCH_TOKEN);
        }

        //로그인하기
        UserDTO userInfo = userMapper.getLoginUserInfo(userDTO);

        UserDTO user = new UserDTO();

        user.setUserNo(userInfo.getUserNo());
        user.setEmail(userInfo.getEmail());
        user.setUserTypeCode(userInfo.getUserTypeCode());

        map.put("userLoginInfo",user);
        map.put("code","success");
        map.put("message","로그인 성공!");
        return map;
    }

    // 이메일 확인
    public Boolean getCheckEmail(String email) {
        int checkEmail = userMapper.getCheckEmail(email);
        if (checkEmail < 1) { // 유저 정보 없음.
            throw new CustomException(ExceptionErrorCode.MEMBER_NOT_FOUND_TOKEN);
        }
        return true;
    }

    //신원 확인
    public Map<String, Object> getCheckIdentity(UserProfileInfoDTO userProfileInfoDTO) {
        int checkIdentity = userMapper.getCheckIdentity(userProfileInfoDTO);
        System.out.println("checkIdenttity:::"+checkIdentity);

        if(checkIdentity != 1) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"email과 일치하는 정보가 없습니다, 다시 확인해주세요");
        }
        String randomString = RandomString.generateRandomString(10);
        System.out.println("Generated Random String:::" + randomString);

        Map<String, Object> map = new HashMap<>();
        map.put("randomString",randomString);
        return map;
    }

    // 비밀번호 재설정
    public Map<String, Object> passwordReset(UserDTO userDTO) {
        //비밀번호 1,2 동일 체크
        if (!Objects.equals(userDTO.getPassword(), userDTO.getPassword2())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        System.out.println("encodedPassword:::  "+encodedPassword);
        userDTO.setPassword(encodedPassword);

        userMapper.updatePassword(userDTO);
        Map<String, Object>map = new HashMap<>();
        map.put("code", "success");
        map.put("message", "비밀번호 변경 성공, 로그인 화면으로 이동합니다.");

        return map;
    }

    //이용약관 가져오기
    public TermsInfoDTO getTermsTypeCode(int termsTypeCode) {
        return userMapper.getTermsTypeCode(termsTypeCode);
    }
}
