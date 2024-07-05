package com.job.dashboard.domain.kakao;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.job.dashboard.domain.dto.UserDTO;
import com.job.dashboard.domain.user.UserMapper;
import com.job.dashboard.domain.user.UserService;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class KakaoServiceImple implements KakaoService{
    private final KakaoMapper kakaoMapper;
    private final UserService userService;
    private final UserMapper userMapper;
    private final SessionUtil sessionUtil;

    @Value("${kakao.token-url}")
    private String kakaoTokenUrl;

    @Value("${kakao.user-info-url}")
    private String kakaoUserInfoUrl;

    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    @Value("${kakao.client-secret}")
    private String clientSecret;

    public ModelAndView handleKakaoLogin(String code) {
        RestTemplate restTemplate = new RestTemplate();
        String accessToken = getAccessToken(restTemplate, code);

        if (accessToken != null) {
            JsonNode userInfoByToken = getUserInfo(restTemplate, accessToken); //id, connected_at, pofperties(nickname)

            System.out.println("카카톡에서 넘어온 토근 확인 (userInfo) :: "+userInfoByToken);
            UserDTO user = new UserDTO();
            user.setEmail(userInfoByToken.get("id").asText());  //(email <= id)

            // 카카오톡 회원가입 유저인지 확인
            int countUserEmail = kakaoMapper.getUserEmailCoun(user);
            if (countUserEmail > 0) { // 회원가입한 유저
                UserDTO userInfo = kakaoMapper.getUserInfo(user); // user_no, email, password, user_type_code...
                System.out.println("회원가입한 유저 정보 확인 (userInfo) ::::  "+userInfo);

                Map<String, Object> map = new HashMap<>();
                map.put("userLoginInfo",userInfo);
                map.put("code","success");
                map.put("message","로그인 성공!");

                sessionUtil.loginUser((UserDTO) map.get("userLoginInfo"));
                return createModelAndView("jsp/index", userInfo);
            }
            // 처음 카카오톡 회원가입한 유저
            System.out.println("userInfoByToken 정보 확인 ::::  "+userInfoByToken);
            user.setPassword("1234"); // 비번
            user.setPassword2("1234");
            user.setUserTypeCode("10"); //회원 유형 코드
            user.setLoginTypeCode("20"); //로그인 유형 코드
            System.out.println("user에 넣은 정보 확인 :::  "+user);

            Map<String, Object> map = userService.insertUser(user);

            // 로그인을 위한 select 쿼리
            if ("success".equals(map.get("code"))) {
                UserDTO userInfo = userMapper.getLoginUserInfo(user); //user_no, email, password, user_type_code...

                System.out.println("로그인을 위한 select 쿼리 정보(userInfo)"+userInfo);

                user.setUserNo(userInfo.getUserNo());
                user.setEmail(userInfo.getEmail());
                user.setUserTypeCode(userInfo.getUserTypeCode());

                System.out.println("session에 넘겨주기 위해 저장한 정보 확인 ::: "+user);

                map.put("userLoginInfo",user);
                map.put("code","success");
                map.put("message","로그인 성공!");
                sessionUtil.loginUser((UserDTO) map.get("userLoginInfo"));
            }

            return createModelAndView("jsp/index", null);
        } else {
            return createModelAndView("jsp/user/login", null);
        }
    }


    //액세스 토큰 요청 -> 받기
    private String getAccessToken(RestTemplate restTemplate, String code) {
        String accessTokenUrl = kakaoTokenUrl + "?grant_type=authorization_code" +
                "&client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&code=" + code +
                "&client_secret=" + clientSecret;

        String response = restTemplate.postForObject(accessTokenUrl, null, String.class);
        ObjectMapper mapper = new ObjectMapper();

        try {
            JsonNode node = mapper.readTree(response); //json타입을 java객체로 변환시킴
            return node.get("access_token").asText();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    ///액세스 토큰으로 사용자 정보를 가져옴
    private JsonNode getUserInfo(RestTemplate restTemplate, String accessToken) {
        String userInfoResponse = restTemplate.getForObject(kakaoUserInfoUrl + "?access_token=" + accessToken, String.class);
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.readTree(userInfoResponse);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //modelAndView
    private ModelAndView createModelAndView(String viewName, UserDTO userInfo) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);
        mav.addObject("userInfo", userInfo);
        return mav;
    }
}
