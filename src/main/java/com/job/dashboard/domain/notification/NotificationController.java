package com.job.dashboard.domain.notification;

import com.job.dashboard.domain.dto.NotificationDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/notify")
public class NotificationController {

    private final NotificationService notificationService;

    /***
     * [구독하기] - 클라이언트가 SSE 스트림을 통해 알림을 실시간으로 받을 수 있도록 설정합니다
     * text/event-stream > SSE (Server-Sent Events)의 콘텐츠 타입
     * SSE 데이터 포맷
     * event: <event name> - 이벤트 타입 (옵션).
     * data: <data> - 전송할 데이터. 여러 줄일 경우 여러 data: 필드를 사용 (필수).
     * id: <id> - 이벤트 ID (옵션).
     * retry: <retry interval> - 재연결 시도 간격 (옵션).
     *
     * 예시
     * event: message
     * data: {"user":"summer","message":"Hello, summer!"}
     * id: 12345
     *
     */
    @GetMapping(value = "/subscribe/{userId}", produces = "text/event-stream;charset=UTF-8")
    public SseEmitter subscribe(@PathVariable Long userId) {
        return notificationService.subscribe(userId);
    }

    @PostMapping("/notify/{userId}")
    public void notify(@PathVariable Long userId, @RequestBody NotificationDTO request) {
        notificationService.sendNotification(userId, request.getMessage(), request.getType());
    }

    @GetMapping("/notifications/{userId}")
    public List<NotificationDTO> getNotifications(@PathVariable Long userId) {
        return notificationService.getNotificationsByUserId(userId);
    }
}