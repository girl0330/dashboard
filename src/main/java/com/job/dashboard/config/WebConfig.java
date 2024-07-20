package com.job.dashboard.config;

import com.job.dashboard.domain.interceptor.LogInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor

public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private LogInterceptor logInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(logInterceptor) // 여기서 new Interceptor() 대신 주입받은 interceptor 사용
                .addPathPatterns("/business/**", "/personal/**")
                .excludePathPatterns("/business/uploadedFile", "/business/uploadedFileGet/{fileId}", "/business/ajax/*", "/business/postJobList", "/business/jobPostDetail","/business/api/notificationList","/business/like/*", "/business/apply", "/business/applyCancel"); // 특정 경로는 제외

    }
}
