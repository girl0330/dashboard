package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.ApiResponse;
import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserInfoDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final SessionUtil sessionUtil;

    /** 회원가입 페이지 */
    @GetMapping("/signUp")
    public String registerView() {
        return "jsp/sign_up";
    }

    /**
     * 회원가입 전 이메일 검사
     * @param userDTO: 이메일
     * @return
     */
    @PostMapping("/ajax/emailDuplicateCheck")
    @ResponseBody
    public ResponseEntity<?> emailDuplicateCheck(@RequestBody UserDTO userDTO) {
        ApiResponse response = userService.checkEmailDuplication(userDTO);
        return ResponseEntity.ok(response);
    }

    //계정 등록
    @PostMapping("/insertSignUp")
    @ResponseBody
    public ResponseEntity<?> insertUser(@RequestBody UserDTO userDTO) {
        ApiResponse response = userService.insertUser(userDTO);
        return ResponseEntity.ok(response);
    }

    //로그인 페이지
    @GetMapping("/login")
    public String loginView() {
        return "jsp/login";
    }


    //로그인
    @PostMapping("/doLogin")
    @ResponseBody
        public ResponseEntity<?> doLogin (@RequestBody UserDTO userDTO) { //todo: 이전페이지로 이동시킬 interceptor
        //userDTO null체크
        ApiResponse response = userService.doLogin(userDTO);

        if (response.getCode() == 200) {
            sessionUtil.loginUser((UserDTO) response.getData());
        }

        String redirectUrl = sessionUtil.getRedirectUrl();


        if (redirectUrl != null) {
            System.out.println("리다이렉트 주소 있음: "+ redirectUrl);
            sessionUtil.removeRedirectUrl(); // 세션에서 URL 제거

            ApiResponse<UserDTO> apiResponse = ApiResponse.<UserDTO>builder()
                    .code(200)
                    .message("리다이렉트 주소가 있는 로그인")
                    .redirectUrl(redirectUrl)
                    .build();

            return ResponseEntity.ok(apiResponse); // 리다이렉트할 URL을 응답에 포함
        }
        return ResponseEntity.ok(response);
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        // 세션 제거
        sessionUtil.logoutUser();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/";
    }

    //비밀번호 재설정
    @GetMapping("/findPassword")
    public String findPasswordView(@RequestParam(value = "userTypeCode") String userTypeCode, Model model) {
        System.out.println("userTypeCode = " + userTypeCode);
        model.addAttribute("userTypeCode", userTypeCode);
        return "jsp/findPassword";
    }

    //재설정- 사용중인 이메일 확인
    @PostMapping("/ajax/checkEmail")
    @ResponseBody
    public ResponseEntity<?> getCheckEmail(@RequestBody UserDTO userDTO) {
        ApiResponse response = userService.getCheckEmail(userDTO);
        return ResponseEntity.ok(response);
    }

    //재설정- 이름, 폰번호 확인  todo: ajax 비동기통신
    @PostMapping("/ajax/checkIdentity")
    @ResponseBody
    public ResponseEntity<?> checkIdentity(@RequestBody UserInfoDTO userInfoDTO) {
        System.out.println(userInfoDTO);
        ApiResponse response = userService.getCheckIdentity(userInfoDTO);
        System.out.println("response 확인 : "+response);
        return ResponseEntity.ok(response);
    }

    //재설정- 비밀번호 재설정 todo: 기업 비밀번호 찾기 수정필요
    @PostMapping("/api/passwordReset")
    @ResponseBody
    public ResponseEntity<?> passwordReset(@RequestBody UserDTO userDTO) {
        ApiResponse response = userService.passwordReset(userDTO);
        return ResponseEntity.ok(response);
    }

    //이용약관 todo: 이용약관
    @GetMapping("/terms")
    public String termsView(Model model) {
        System.out.println("약관동의 페이지 ");


        model.addAttribute("termsTypeCode10",userService.getTermsTypeCode(10)); // 이용약관
        model.addAttribute("termsTypeCode20",userService.getTermsTypeCode(20)); // 개인정보

        return "jsp/terms";
    }
    @GetMapping("/ajax/terms")
    @ResponseBody
    public TermsInfoDTO termsInfo(@RequestParam int termsTypeCode) {
        System.out.println("ajax 약관동의 페이지 ");
        System.out.println("termsTypeCode :::: " + termsTypeCode);
        TermsInfoDTO result = null;

        if (termsTypeCode == 10) {
            result = userService.getTermsTypeCode(10);
        } else if (termsTypeCode == 20) {
            result = userService.getTermsTypeCode(20);
        }
        return result;
    }


    //개인정보
    @GetMapping("/privacy")
    public String privacyView(Model model) {
        System.out.println("개인정보 페이지 ");

        model.addAttribute("termsTypeCode10",userService.getTermsTypeCode(10)); // 이용약관
        model.addAttribute("termsTypeCode20",userService.getTermsTypeCode(20)); // 개인정보

        return "jsp/privacy_policy_agreed";
    }

}
