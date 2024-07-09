package com.job.dashboard.domain.notification;

import com.job.dashboard.domain.dto.NotificationDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private static final Long DEFAULT_TIMEOUT = 5 * 60 * 1000L; //5분설정
    private static final Logger logger = LoggerFactory.getLogger(NotificationService.class);

    private final EmitterRepository emitterRepository;
    private final NotificationMapper notificationMapper;


    public SseEmitter subscribe(int userNo) {
        SseEmitter emitter = createEmitter(userNo); //userNo를 eitter객체로 생성
        sendNotification(userNo, "SSE 연결 완료.", "connect");
        return emitter;
    }

    public void sendNotification(int userNo, String message, String notifyTypeCode) {
        NotificationDTO notification = new NotificationDTO(userNo, message, notifyTypeCode);

        SessionUtil sessionUtil = new SessionUtil();

        notification.setSystemRegisterId((int) sessionUtil.getAttribute("userNo"));
        if(!"connect".equals(notifyTypeCode)) { //notifyTypeCode가 connect가 아니면 DB에 notifyTypeCode가 저장됨.
            notificationMapper.insertNotification(notification); // 알림보낼 타입 코드 저장
        }

        SseEmitter emitter = emitterRepository.get(userNo);  //emitter객체 꺼내옴
        String eventId = userNo + "_" + System.currentTimeMillis(); //emitter객체 식별

        System.out.println("eventId ;;"+eventId);
        System.out.println("emitter::   "+emitter);

        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event()
                        .id(eventId)
                        .name(notifyTypeCode)
                        .data(message)
                        .comment("신규 알림"));
            } catch (IOException e) {
                emitterRepository.deleteById(userNo);
                emitter.completeWithError(e);
                System.out.println("알림 전송 오류 유저번호 : " + userNo + " : " + e.getMessage());
            }
        } else {
            logger.warn("Emitter not found for userNo: {}", userNo);
        }
    }

    public List<NotificationDTO> getNotificationsByUserId(int userNo) { //로그인 한사람
        System.out.println("userNo가 넘어옴? ::: " + userNo);
        return notificationMapper.findNotificationsByUserNo(userNo);
    }

    private SseEmitter createEmitter(int userNo) {
        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
        emitterRepository.save(userNo, emitter);

        emitter.onCompletion(() -> {
            emitterRepository.deleteById(userNo);
            logger.info("SSE 연결 완료 유저번호 : " + userNo);
        });
        emitter.onTimeout(() -> {
            emitterRepository.deleteById(userNo);
            logger.info("SSE 연결 타임아웃 유저번호 : " + userNo);
        });

        return emitter;
    }

    // 알림 삭제 ?
}