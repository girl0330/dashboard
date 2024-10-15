//package com.job.dashboard.domain.notification;
//
//import com.job.dashboard.domain.dto.NotificationDTO;
//import com.job.dashboard.util.SessionUtil;
//import lombok.RequiredArgsConstructor;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
//
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//@RestController
//@RequiredArgsConstructor
//@RequestMapping("/api/v1/notification") //todo: 해당 api 다시 공부하기
//public class NotificationController {
//
//    private final SessionUtil sessionUtil;
//    private final NotificationService notificationService;
//    private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
//
//    /**
//     * 구독하기
//     * */
//    @GetMapping(value = "/subscribe", produces = "text/event-stream;charset=UTF-8")
//    public ResponseEntity<SseEmitter> subscribe() {
//        if (!sessionUtil.loginUserCheck()) {
//            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
//        }
//
//        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");//수신자
//        if (userNo == null) {
//            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//        }
//
//        SseEmitter emitter = notificationService.subscribe(userNo); //SseEmitter 서버에서 클라이언트로 비동기 이벤트를 보내는 데 사용
//        logger.info("User {} subscribed", userNo);
//        return new ResponseEntity<>(emitter, HttpStatus.OK);
//    }
//
////    /**
////     * 알림전송
////     * */
////    @PostMapping("/send/{userNo}")
////    public void sendNotification(@PathVariable int userNo, @RequestBody NotificationDTO request) {
////        notificationService.sendNotification(userNo, request.getMessage(), request.getNotifyTypeCode());
////    }
////
////    /**
////     * 알림조회
////     * */
////    @GetMapping("/{userNo}")
////    public List<NotificationDTO> getNotifications(@PathVariable int userNo) {
////        return notificationService.getNotificationsByUserId(userNo);
////    }
//}