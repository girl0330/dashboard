package com.job.dashboard.config;

import com.job.dashboard.domain.interceptor.LogInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor

public class WebConfig implements WebMvcConfigurer {
    private final LogInterceptor logInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(logInterceptor) // 여기서 new Interceptor() 대신 주입받은 interceptor 사용
                .addPathPatterns("/business/writePostJob"); // 인터셉터를 적용할 URL 패턴을 지정
//                .excludePathPatterns("/resources/**", "/static/**", "/public/**", "/META-INF/resources/**");
    }
}
