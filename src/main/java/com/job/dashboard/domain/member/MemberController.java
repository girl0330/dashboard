package com.march.studyjsp.domain.dailyJop.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")

public class UserController {
    private final UserService userService;

    //회원가입
    @GetMapping("/signup")
    public String signupView() {
        System.out.println("회원가입 화면");
        return "jsp/member/member_new_choice";
    }

    //개인회원가입 폼
    @GetMapping("/personal")
    public String personalView() {
        System.out.println("개인회원가입 화면");
        return "jsp/member/member_personal_register";
    }

    //기업회원가입폼
    @GetMapping("/business")
    public String businessView() {
        System.out.println("기업회원가입 화면");
        return "jsp/member/member_business_register";
    }

    // 회원등록 api
    @PostMapping("/signupUserInsert")
    @ResponseBody //데이터를 반환할 때
    public Map<Object, Object> userSignup(@RequestBody UserDTO userDTO, HttpSession session) {
        System.out.println("=====회원등록====" + userDTO);
        Map<Object, Object> map = userService.createUser(userDTO);
        System.out.println("map확인 " +map);
        //session.setAttribute("map",map);
        //System.out.println("session확인;;;"+session);
        return map;
    }

    //로그인
    @GetMapping("/login")
    public String loginView(Model model) {
        System.out.println("로그인 화면1");

        return "jsp/member/member_new_login_choice";
    }

    @PostMapping("/personalLoginUser")
    public Map<Object, Object> personalLoginUser(@RequestBody UserDTO userDTO) {
        System.out.println("====개인 로그인====");

        Map<Object, Object> map = userService.personalUserService(userDTO);

        System.out.println("로그인 result;;;;");
        if("error".equals(map.get("code"))) {
            return map;
        }
        System.out.println("hey!!!!!"+map);
        return map;
    }

    @PostMapping("/businessLoginUser")
    public Map<Object, Object> businessLoginUser(@RequestBody UserDTO userDTO) {
        System.out.println("====기업 로그인====");

        Map<Object, Object> map = userService.businessUserService(userDTO);

        System.out.println("로그인 정보 확인;;;;"+map);
        return map;
    }

    //로그아웃
    @GetMapping("/logout")
    public String logoutUser (HttpSession session) {
        System.out.println("====로그아웃====");
        session.invalidate();
        return "/";
    }

    @GetMapping("/profile")
        public String profileView (HttpSession session, Model model) {
        Object userLogInfo = session.getAttribute("userInfo"); // 로그인한 회원의 정보 가져옴
        System.out.println(userLogInfo);
        if (userLogInfo != null) { // 로그인 상태 확인
            System.out.println("로그인 상태임");
            UserDTO userInfo = (UserDTO) session.getAttribute("userInfo"); //세션에서 정보 가져오기
            UserDTO user = userService.findUser(userInfo.getUserId()); // id값을 넘겨주고 user 정보 받기
            model.addAttribute("user", user); //user정보 뷰로 보내기
            return "jsp/user/user_profile"; // 상세정보로 이동
        } else {
            System.out.println("로그인 상태 아님");
            return "redirect:/user/login";
        }
    }

    // 회원정보 수정
    @PostMapping("/update")
    public Map<Object, Object> userUpdate (@RequestBody UserDTO userDTO) {
        System.out.println("====회원정보 수정====");
        userDTO.setUuid(2);
        System.out.println("입력한 정보 확인;;;;;"+userDTO);
        Map<Object, Object> infomation = userService.userUpdate(userDTO);
        return infomation;
    }


//    @PostMapping("/update")
//    public Map<Object, Object> userUpdate (UserDTO userDTO, HttpSession session) {
//        System.out.println("====회원정보 수정====");
//        UserDTO userInfo = (UserDTO) session.getAttribute("userInfo"); //세션에서 정보 가져옴
//        userDTO.setUuid(userInfo.getUuId()); //정보에서 id를 가져와서 dto에 넣기
//        Map<Object, Object> infomation = userService.userUpdate(userDTO);
//        return infomation;
//    }


    //회원정보 상세보기
//    @GetMapping("/profile")
//    public String profileView () {
//        System.out.println("====회원정보====");
//
//        UserDTO userDTO = new UserDTO();
//        userDTO.setUserId("qwer1");
//        System.out.println(userDTO);
//
//        if (userDTO != null) {
//            System.out.println("데이터 있음");
//            UserDTO user = userService.findUser(userDTO);
//            System.out.println(user);
//            return "jsp/user/user_profile";
//        } else {
//            return "redirect:/user/login";
//        }
//    }
}
