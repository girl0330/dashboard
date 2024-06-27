package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.UserDTO;
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
        System.out.println("====이메일 중복인가 확인 impl=====");
        Map<String, Object> map = new HashMap<>();
        int emailCheck = userMapper.emailDuplicateCheck(userDTO);
        System.out.println("???");
        if (emailCheck > 0) { // 동일한 이메일이 있다면
            throw new CustomException(ExceptionErrorCode.EMAIL_ALREADY_IN_USE_TOKEN);
        }

        System.out.println("00000");
        map.put("code", "success");
        map.put("message","사용가능한 이에일 입니다.");
        return map;
    }

    // 회원가입
    public Map<String, Object> accountInsert(UserDTO userDTO) {
        System.out.println("====계정 저장 impl=====");
        Map<String, Object> map = new HashMap<>();

        //이메일 중복 체크
        int emailCheck = userMapper.emailDuplicateCheck(userDTO);

        if (emailCheck > 0) { // 동일한 이메일이 있다면
            throw new CustomException(ExceptionErrorCode.EMAIL_ALREADY_IN_USE_TOKEN);
        }
        System.out.println("중복체크 완료");

        //비밀번호 1,2 동일 체크
        if (!Objects.equals(userDTO.getPassword(), userDTO.getPassword2())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }
        System.out.println("동일체크 완료");

        //비밀번호 인코딩
        String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        System.out.println("인코딩된 비밀번호 확인 "+encodedPassword);

        userDTO.setPassword(encodedPassword);

        userMapper.accountInsert(userDTO);
        map.put("code", "success");
        map.put("message","회원가입성공");
        System.out.println("계정등록");

        return map;
    }

    //로그인
    public  Map<String, Object> findAccount(UserDTO userDTO) {
        System.out.println("로그인 임플====================================");
        Map<String, Object> map = new HashMap<>();
        String email = userDTO.getEmail();
        String password = userDTO.getPassword();
        String enteredUserTypeCode = userDTO.getUserTypeCode();
        System.out.println("유저 타입 코드 확인 : "+enteredUserTypeCode);

        //이메일이 있는지 확인
        String hashedPassword = userMapper.getHashedPassword(email);
        System.out.println("비밀번호 가져왔나???????   "+hashedPassword);

        if (hashedPassword == null) {
            System.out.println("그런 이메일 없음.");
            throw new CustomException(ExceptionErrorCode.MEMBER_NOT_FOUND_TOKEN);
        }

        //비밀번호 존재하는지, 일치하는지 확인
        boolean pwCheck = passwordEncoder.matches(password, hashedPassword); // 일치하는지 확인
        System.out.println(pwCheck); // 일치하면 ture 반환
        if (!pwCheck) {
            System.out.println("해당 비밀번호는 없음");
            throw new CustomException(ExceptionErrorCode.PASSWORD_INCORRECT_TOKEN);
        }

        System.out.println("비밀번호가 존재함");
        userDTO.setPassword(hashedPassword);
        System.out.println("최종 dto확인 ;:::::  "+userDTO);

        //타입코드가 맞는지 확인
        String getUserTypeCode = userMapper.getUserTypeCode(email);
        System.out.println("이메일로 가져온 타입코드: " + getUserTypeCode);
        System.out.println("입력된 타입코드: " + enteredUserTypeCode);
        if (!Objects.equals(getUserTypeCode, enteredUserTypeCode)) {
            System.out.println("타입코드가 일치하지 않습니다.");
            throw new CustomException(ExceptionErrorCode.USER_TYPE_CODE_MISMATCH_TOKEN);
        }

        //로그인하기
        UserDTO userAccount = userMapper.findAccount(userDTO);
        System.out.println("이메일과 비밀번호로 계정 잘 가져왔나?????    ");

        UserDTO user = new UserDTO();

        user.setUserNo(userAccount.getUserNo());
        user.setEmail(userAccount.getEmail());
        user.setUserTypeCode(userAccount.getUserTypeCode());

        System.out.println("user : "+user);

        System.out.println(userAccount);
        map.put("account",user);
        map.put("code","success");
        map.put("message","로그인 성공!");
        return map;
    }
}
