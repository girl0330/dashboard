package com.job.dashboard.domain.notification;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Repository
@RequiredArgsConstructor
public class EmitterRepository {

    private final Map<Integer, SseEmitter> emitters = new ConcurrentHashMap<>();

    public void save(int userNo, SseEmitter emitter) {
        emitters.put(userNo, emitter);
    }

    public void deleteById(int userNo) {
        emitters.remove(userNo);
    }

    public SseEmitter get(int userNo) {
        return emitters.get(userNo);
    }
}