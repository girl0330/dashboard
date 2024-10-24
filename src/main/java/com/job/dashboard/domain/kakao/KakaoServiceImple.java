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
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class KakaoServiceImple implements KakaoService {
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
        ModelAndView modelAndView = new ModelAndView();
        String accessToken = getAccessToken(restTemplate, code);

        if (accessToken != null) {
            JsonNode kakaoUserInfo = getKakaoUserInfo(restTemplate, accessToken); //id, connected_at, pofperties(nickname)
            String kakaoUserId = String.valueOf(kakaoUserInfo.get("id"));

            kakaoMapper.getUserInfo(kakaoUserId).ifPresentOrElse(
                    userInfo -> {
                        handleExistingUser(userInfo, modelAndView);
                    },
                    () -> {
                        //값이 없을경우
                        UserDTO userDTO = new UserDTO();
                        userDTO.setEmail(kakaoUserId);
                        userDTO.setPassword("abc135!!"); // 비번
                        userDTO.setPassword2("abc135!!");
                        userDTO.setUserTypeCode("10"); //회원 유형 코드
                        userDTO.setLoginTypeCode("20"); //로그인 유형 코드

                        userMapper.insertUser(userDTO);
                        UserDTO userInfo = userMapper.getLoginUserInfo(userDTO); //user_no, email, password, user_type_code...
                        handleExistingUser(userInfo, modelAndView);

                    }
            );
        } else {
            modelAndView.setViewName("redirect:/user/login");
        }
        return modelAndView;
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
            throw new RuntimeException("Failed to parse access token from response", e);
        }
    }

    ///액세스 토큰으로 사용자 정보를 가져옴
    private JsonNode getKakaoUserInfo(RestTemplate restTemplate, String accessToken) {
        String userInfoResponse = restTemplate.getForObject(kakaoUserInfoUrl + "?access_token=" + accessToken, String.class);
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.readTree(userInfoResponse);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private void handleExistingUser(UserDTO userInfo, ModelAndView modelAndView) {
        sessionUtil.loginUser(userInfo);
        modelAndView.setViewName("redirect:/");
    }
}
