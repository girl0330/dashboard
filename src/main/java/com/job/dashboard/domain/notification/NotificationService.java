package com.job.dashboard.domain.notification;

import com.job.dashboard.domain.dto.NotificationDTO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private static final Long DEFAULT_TIMEOUT = 60 * 1000L;

    private final EmitterRepository emitterRepository;
    private final NotificationMapper notificationMapper;

    public SseEmitter subscribe(int userNo) {
        SseEmitter emitter = createEmitter(userNo);
        sendNotification(userNo, "SSE 연결 완료.", "connect");
        return emitter;
    }

    public void sendNotification(int userNo, String message, String type) {
        NotificationDTO notification = new NotificationDTO(userNo, message, type);
        notificationMapper.insertNotification(notification);
        SseEmitter emitter = emitterRepository.get(userNo);

        String eventId = userNo + "_" + System.currentTimeMillis();

        System.out.println("eventId:::   "+eventId);


        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event()
                        .id(eventId)
                        .name(type)
                        .data(message)
                        .comment("신규 알림"));
            } catch (IOException e) {
                emitterRepository.deleteById(userNo);
                emitter.completeWithError(e);
                System.out.println("알림 전송 오류 유저번호 : " + userNo + " : " + e.getMessage());
            }
        }
    }

    public List<NotificationDTO> getNotificationsByUserId(int userNo) {
        return notificationMapper.findNotificationsByUserNo(userNo);
    }

    private SseEmitter createEmitter(int userNo) {
        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(userNo, emitter);

        emitter.onCompletion(() -> emitterRepository.deleteById(userNo));
        emitter.onTimeout(() -> emitterRepository.deleteById(userNo));

        return emitter;
    }
}