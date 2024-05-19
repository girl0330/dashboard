package com.job.dashboard.domain.parsonalDashboard;

import com.job.dashboard.domain.member.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PDServiceImpl implements PDService {
    final private PDMapper pdMapper;

    public Map<Object, Object> saveProfile(Long uuid) {
        Map<Object, Object> map = new HashMap<>();
        pdMapper.saveProfile(uuid);
        map.put("code","success");
        map.put("message","로그인 성공!");
        return map;
    }
}
