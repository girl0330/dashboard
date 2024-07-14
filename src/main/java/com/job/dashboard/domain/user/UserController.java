package com.job.dashboard.domain.user;

import com.job.dashboard.domain.dto.TermsInfoDTO;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final SessionUtil sessionUtil;
//    private final KakaoApi kakaoApi;

    //회원가입 페이지
    @GetMapping("/signup")
    public String signupView() {
        return "jsp/register";
    }

    // 이메일 중복 검사
    @PostMapping("/emailDuplicateCheck")
    @ResponseBody
    public Map<String, Object> emailDuplicateCheck(@RequestBody UserDTO userDTO) {

        return userService.emailDuplicateCheck(userDTO);
    }

    //계정 등록
    @PostMapping("/insertSignUp")
    @ResponseBody
    public Map<String, Object> insertSignUp(@RequestBody UserDTO userDTO) {
        return userService.insertUser(userDTO);
    }

    //로그인 페이지
    @GetMapping("/login")
    public String loginView() {
        return "jsp/login";
    }

    //로그인
    @PostMapping("/doLogin")
    @ResponseBody
        public Map<String, Object> doLogin (@RequestBody UserDTO userDTO, HttpServletRequest request) {

        Map<String, Object> map = userService.doLogin(userDTO);
        System.out.println("로그인 완");
        System.out.println("map확인 ;::: "+map);

        if (!"error".equals(map.get("code"))) {
            sessionUtil.loginUser((UserDTO) map.get("userLoginInfo"));
        }

        String prevPage = (String) request.getSession().getAttribute("prevPage");
        String referer = request.getHeader("Referer");

        System.out.println("이전 페이지 url : " + prevPage);
        System.out.println("Referer 헤더 값 : " + referer);

        //이전 페이지 없음지 않거나,  이전 페이지는 있지만 referer은 없음. referer이 login을 포함 하면 이전 페이지로 이동시킬 필요 없음.
        if (prevPage != null && (referer == null || !referer.contains("/login"))) {
            System.out.println("이전 페이지 있음");
            request.getSession().removeAttribute("prevPage");
            map.put("code","redirect");
            map.put("redirectUrl", prevPage);
            return map;
        } else if (prevPage != null) {
            // Referer 헤더가 없더라도 prevPage 값이 있는 경우 처리
            System.out.println("Referer 헤더가 없지만, 이전 페이지 있음");
            request.getSession().removeAttribute("prevPage");
            map.put("code","redirect");
            map.put("redirectUrl", prevPage);
            return map;
        }
        System.out.println("map확인? ;::: "+map);

        return map;
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        // 세션 제거
        sessionUtil.logoutUser();
        // 로그아웃 후 리다이렉션할 페이지로 이동
        return "redirect:/login";
    }

    //비밀번호 재설정
    @GetMapping("/findPassword")
    public String findPasswordView() {
        return "jsp/user-findPassword";
    }

    //재설정- 이메일 확인
    @PostMapping("/checkEmail")
    @ResponseBody
    public Boolean getCheckEmail(@RequestBody UserDTO userDTO) {
        return userService.getCheckEmail(userDTO.getEmail());
    }

    //재설정- 이름, 폰번호 확인
    @PostMapping("/checkIdentity")
    @ResponseBody
    public Map<String, Object> checkIdntity(@RequestBody UserProfileInfoDTO userProfileInfoDTO, Model model) {
        System.out.println("이름, 폰번호, email 확인 ::::  "+userProfileInfoDTO.getName() + "/" +userProfileInfoDTO.getPhone()+ "/" +userProfileInfoDTO.getEmail());
        Map<String, Object> map = userService.getCheckIdentity(userProfileInfoDTO);

        System.out.println("randomString확인 ::::  "+map.get("randomString"));
        model.addAttribute("randomString", map.get("randomString"));
        return map;
    }

    //재설정- 비밀번호 재설정
    @PostMapping("/passwordReset")
    @ResponseBody
    public Map<String, Object> passwordReset(@RequestBody UserDTO userDTO) {
        System.out.println("넘어온 데이터 확인 ::::  "+userDTO);
        return userService.passwordReset(userDTO);
    }

    //이용약관
    @GetMapping("/terms")
    public String termsView(Model model) {
        System.out.println("약관동의 페이지 ");

        model.addAttribute("termsTypeCode10",userService.getTermsTypeCode(10)); // 이용약관
        model.addAttribute("termsTypeCode20",userService.getTermsTypeCode(20)); // 개인정보

        return "jsp/terms_and_conditions";
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
