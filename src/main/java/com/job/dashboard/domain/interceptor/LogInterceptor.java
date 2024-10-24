package com.job.dashboard.domain.interceptor;

import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class LogInterceptor implements HandlerInterceptor {
    private final SessionUtil sessionUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("가로챔");
        // 요청 전 처리 로직
        if (!sessionUtil.loginUserCheck()) {
            // 현재 요청 URL 저장
            String currentUrl = request.getRequestURI();
            String queryString = request.getQueryString();
            if (queryString != null) {
                currentUrl += "?" + queryString;
            }
            sessionUtil.setRedirectUrl(currentUrl);

            response.sendRedirect("/user/login");
            return false; // 요청 처리를 중단하고 로그인 페이지로 이동
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 요청 후 처리 로직 (뷰 렌더링 전)
        System.out.println("postHandle: 요청 처리 후, 뷰 렌더링 전");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 뷰 렌더링 후 처리 로직
        System.out.println("afterCompletion: 뷰 렌더링 후");
    }
}
