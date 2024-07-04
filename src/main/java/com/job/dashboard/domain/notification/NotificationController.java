package com.job.dashboard.domain.notification;

import com.job.dashboard.domain.dto.NotificationDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/notification")
public class NotificationController {

    private final SessionUtil sessionUtil;
    private final NotificationService notificationService;
    private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);

    /**
     * 구독하기
     * */
    @GetMapping(value = "/subscribe", produces = "text/event-stream;charset=UTF-8")
    public ResponseEntity<SseEmitter> subscribe() {
        if (!sessionUtil.loginUserCheck()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        int userNo = (int)sessionUtil.getAttribute("userNo");
        SseEmitter emitter = notificationService.subscribe(userNo);
        logger.info("User {} subscribed", userNo);
        return new ResponseEntity<>(emitter, HttpStatus.OK);
    }

    /**
     * 알림전송
     * */
    @PostMapping("/send/{userNo}")
    public void sendNotification(@PathVariable int userNo, @RequestBody NotificationDTO request) {
        notificationService.sendNotification(userNo, request.getMessage(), request.getType());
    }

    /**
     * 알림조회
     * */
    @GetMapping("/{userNo}")
    public List<NotificationDTO> getNotifications(@PathVariable int userNo) {
        return notificationService.getNotificationsByUserId(userNo);
    }
}