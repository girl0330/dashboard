package com.job.dashboard.domain.notification;

import com.job.dashboard.domain.dto.NotificationDTO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private static final Long DEFAULT_TIMEOUT = 600L * 1000 * 60;

    private final EmitterRepository emitterRepository;
    private final NotificationMapper notificationMapper;

    public SseEmitter subscribe(Long userId) {
        SseEmitter emitter = createEmitter(userId);
        sendNotification(userId, "SSE connection established.", "connection");
        return emitter;
    }

    public void sendNotification(Long userId, String message, String type) {
        NotificationDTO notification = new NotificationDTO(userId, message, type);
        notificationMapper.insertNotification(notification);
        SseEmitter emitter = emitterRepository.get(userId);

        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event()
                        .id(String.valueOf(userId))
                        .name(type)
                        .data(message)
                        .comment("New notification"));
            } catch (IOException e) {
                emitterRepository.deleteById(userId);
                emitter.completeWithError(e);
                System.out.println("Failed to send event to user " + userId + ": " + e.getMessage());
            }
        }
    }

    public List<NotificationDTO> getNotificationsByUserId(Long userId) {
        return notificationMapper.findNotificationsByUserId(userId);
    }

    private SseEmitter createEmitter(Long userId) {
        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(userId, emitter);

        emitter.onCompletion(() -> emitterRepository.deleteById(userId));
        emitter.onTimeout(() -> emitterRepository.deleteById(userId));

        return emitter;
    }
}