package com.job.dashboard.domain.interceptor;

import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Component
@RequiredArgsConstructor
public class LogInterceptor implements HandlerInterceptor {
    private final SessionUtil sessionUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 요청 전 처리 로직
        System.out.println("preHandle: 요청 처리 전");
//
//        if (!sessionUtil.loginUserCheck()) {
//            response.sendRedirect("/user/login");
//            return false; // 페이지 접근 거부
//        }

        return true; // false를 반환하면 요청 처리가 중단됨
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
