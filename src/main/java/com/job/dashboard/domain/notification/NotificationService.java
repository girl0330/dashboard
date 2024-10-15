//package com.job.dashboard.domain.notification;
//
//import com.job.dashboard.domain.dto.NotificationDTO;
//import com.job.dashboard.domain.dto.UserDTO;
//import com.job.dashboard.domain.user.UserMapper;
//import com.job.dashboard.util.SessionUtil;
//import lombok.RequiredArgsConstructor;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
//
//import java.io.IOException;
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//@Service
//@RequiredArgsConstructor
//public class NotificationService {
//
//    private static final Long DEFAULT_TIMEOUT = 5 * 60 * 1000L; //5분설정
//    private static final Logger logger = LoggerFactory.getLogger(NotificationService.class);
//    public static Map<Integer, SseEmitter> sseEmitters = new ConcurrentHashMap<>();
//
//    private final EmitterRepository emitterRepository;
//    private final NotificationMapper notificationMapper;
//    private final SessionUtil sessionUtil;
//    private final UserMapper userMapper;
//
//
//    public SseEmitter subscribe(int userNo) {//수신자와 연결
//        // 1. SseEmitter 객체 생성
//        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
//
//        try {
//            // 2. 클라이언트에게 초기 연결 메시지 전송
//            emitter.send(SseEmitter.event().name("connect").data("SSE 연결 완료"));
//        } catch (IOException e) {
//            e.printStackTrace();
//            sseEmitters.remove(userNo); // 오류 발생 시 emitter 제거
//        }
//
//        // 3. Emitter를 Map에 저장하여 사용자와의 연결을 관리
//        sseEmitters.put(userNo, emitter);
//
//        // 4. 연결이 완료되거나 타임아웃, 에러 발생 시 해당 사용자와의 연결 제거
//        emitter.onCompletion(() -> sseEmitters.remove(userNo));
//        emitter.onTimeout(() -> sseEmitters.remove(userNo));
//        emitter.onError((e) -> sseEmitters.remove(userNo));
//        return emitter;
//    }
//
//    // 좋아요 수신 알림()
//    public void notifyLike(int receiver, String message, String notifyTypeCode) {
//        NotificationDTO notificationDTO = new NotificationDTO(receiver, message, notifyTypeCode);
//
//
//    }
//
//    public void notification(int receiver, String message, String notifyTypeCode) {
//
//        SseEmitter emitter = emitterRepository.get(receiver);
//        if (emitter == null) {
//            logger.warn("Emitter not found for userNo: {}", receiver);
//            return;
//        }
//
//        sendNotification(receiver, message, notifyTypeCode);
//
//        if (sseEmitters.containsKey(receiver)) {
//            SseEmitter sseEmitterReceiver = sseEmitters.get(receiver);
//            try {
//                sseEmitterReceiver.send(SseEmitter.event().name(notifyTypeCode).data(message));
//            } catch (IOException e) {
//                sseEmitters.remove(receiver);
//            }
//        }
//    }
//
////    public void  notification(int receiver, String message, String notifyTypeCode) { //수신자 id
////        NotificationDTO notificationDTO = createAndSaveNotification(receiver, message, notifyTypeCode);
////
////        sendNotification(notificationDTO.getReceiverId(), message, notifyTypeCode);
////    }
////
////    public NotificationDTO createAndSaveNotification(int receiver, String message, String notifyTypeCode) {
////        NotificationDTO notificationDTO = new NotificationDTO(receiver, message, notifyTypeCode);
////
////        //수신자 id
////        int giverId = (int) sessionUtil.getAttribute("userNo");
////        notificationDTO.setGiverId(giverId);
////
////        notificationMapper.insertNotification(notificationDTO);
////        return notificationDTO;
////    }
////
//    public void sendNotification(int receiverId, String message, String notifyTypeCode) {
//        SseEmitter emitter = emitterRepository.get(receiverId);
//        String eventId = receiverId + "_" + System.currentTimeMillis(); //emitter객체 식별
//
//        try {
//            emitter.send(SseEmitter.event()
//                    .id(eventId)
//                    .name(notifyTypeCode)
//                    .data(message));
//        } catch (IOException e) {
//            emitterRepository.deleteById(receiverId);
//            emitter.completeWithError(e);
//            System.out.println("알림 전송 오류 유저번호 : " + receiverId + " : " + e.getMessage());
//        }
//    }
//
//    public List<NotificationDTO> getNotificationsByUserId(int userNo) { //로그인 한사람
//        System.out.println("userNo가 넘어옴? ::: " + userNo);
//        return notificationMapper.findNotificationsByUserNo(userNo);
//    }
//
//    private SseEmitter createEmitter(int userNo) {
//        SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
//        emitterRepository.save(userNo, emitter);
//
//        emitter.onCompletion(() -> {
//            emitterRepository.deleteById(userNo);
//            logger.info("SSE 연결 완료 유저번호 : " + userNo);
//        });
//        emitter.onTimeout(() -> {
//            emitterRepository.deleteById(userNo);
//            logger.info("SSE 연결 타임아웃 유저번호 : " + userNo);
//        });
//
//        return emitter;
//    }
//
//    // 알림 삭제 ?
//}