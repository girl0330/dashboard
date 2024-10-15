package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserInfoDTO;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //이메일 중복인가 확인
    public ApiResponse checkEmailDuplication(UserDTO userDTO) {
        int isEmail = userMapper.getCheckEmail(userDTO.getEmail());
        if (isEmail > 0) {
            throw new CustomException(ExceptionErrorCode.EMAIL_ALREADY_IN_USE_TOKEN);
        }

        return ApiResponse.builder()
                .code(200)
                .message("사용 가능한 이메일입니다.")
                .build();
    }

    // 회원가입
    public ApiResponse insertUser(UserDTO userDTO) {

        //회원가입 코드 일반 회원가입("10"), 카카오 회원가입("20")
        userDTO.setLoginTypeCode("10");

        //이메일 중복 체크
        int isEmail = userMapper.getCheckEmail(userDTO.getEmail());
        if (isEmail > 0) {
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

        return ApiResponse.builder()
                .code(200)
                .message("회원가입을 환영합니다.")
                .build();
    }

    //로그인
    public ApiResponse doLogin(UserDTO userDTO) {
        String email = userDTO.getEmail();
        String password = userDTO.getPassword();
        String enteredUserTypeCode = userDTO.getUserTypeCode();

        String hashedPassword = userMapper.getHashedPassword(email);
        if (hashedPassword == null) {
            throw new CustomException(ExceptionErrorCode.MEMBER_NOT_FOUND_TOKEN); //유저 정보를 찾을 수 없음
        }
        boolean pwCheck = passwordEncoder.matches(password, hashedPassword);
        if (!pwCheck) {
            throw new CustomException(ExceptionErrorCode.PASSWORD_INCORRECT_TOKEN);
        }

        String savedUserTypeCode = userMapper.getUserTypeCode(email);
        if (!Objects.equals(savedUserTypeCode, enteredUserTypeCode)) {
            throw new CustomException(ExceptionErrorCode.USER_TYPE_CODE_MISMATCH_TOKEN);
        }

        UserDTO userInfo = userMapper.getLoginUserInfo(userDTO);

        UserDTO user = new UserDTO();

        user.setUserNo(userInfo.getUserNo());
        user.setEmail(userInfo.getEmail());
        user.setUserTypeCode(userInfo.getUserTypeCode());

        return ApiResponse.<UserDTO>builder()
                .code(200)
                .message("로그인을 환영합니다.")
                .data(user)  // UserDTO 타입의 객체를 data 필드에 담음
                .redirectUrl(null)
                .build();
    }

    // 이메일 확인 todo: 이메일검사4
    public ApiResponse getCheckEmail(UserDTO userDTO) {
        int isEmail = userMapper.getCheckEmail(userDTO.getEmail());
        if (isEmail < 1) {
            throw new CustomException(ExceptionErrorCode.MEMBER_NOT_FOUND_TOKEN);
        }
        return ApiResponse.builder()
                .code(200)
                .message("유저 정보와 일치합니다.")
                .build();
    }

    //신원 확인
    public ApiResponse getCheckIdentity(UserInfoDTO userInfoDTO) {
        int checkIdentity = userMapper.getCheckIdentity(userInfoDTO);
        System.out.println("checkIdenttity:::"+checkIdentity);

        if(checkIdentity < 1) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"email과 일치하는 정보가 없습니다, 다시 확인해주세요");
        }

        String randomString = RandomString.generateRandomString(10);
        System.out.println("Generated Random String:::" + randomString);

        return ApiResponse.builder()
                .code(200)
                .message("유저 정보와 일치합니다.")
                .data(randomString)
                .build();
    }

    // 비밀번호 재설정
    public ApiResponse passwordReset(UserDTO userDTO) {
        //비밀번호 1,2 동일 체크
        if (!Objects.equals(userDTO.getPassword(), userDTO.getPassword2())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        userDTO.setPassword(encodedPassword);

        userMapper.updatePassword(userDTO);
        return ApiResponse.builder()
                .code(200)
                .message("비밀번호 변경 성공, 로그인 화면으로 이동합니다.")
                .build();
    }

    //이용약관 가져오기
    public TermsInfoDTO getTermsTypeCode(int termsTypeCode) {
        return userMapper.getTermsTypeCode(termsTypeCode);
    }
}
