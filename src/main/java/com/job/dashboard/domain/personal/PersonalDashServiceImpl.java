package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PersonalDashServiceImpl implements PersonalDashService{
    private final PersonalDashMapper personalDashMapper;

    public Map<Object, Object> saveProfile(PersonalDTO personalDTO, HttpSession session) {
        System.out.println("======impl====");
        Map<Object,Object> map = new HashMap<>();
        int userId = (int)session.getAttribute("userId");

        List<PersonalDTO> profile = personalDashMapper.checkProfile(userId);

        int x = profile.size();

        if (x == 0) {
            int profileSeq = personalDashMapper.getProfileIdSeq(userId);
            personalDTO.setProfileId(profileSeq);
        }else{
            personalDTO.setProfileId(profile.get(0).getProfileId());
        }
        personalDTO.setUserId(userId);

        //pk가 없으면 insert 있으면 update
        personalDashMapper.saveProfile(personalDTO);


        map.put("code","success");
        map.put("message","프로필 저장 성공!");
        return map;
    }

    public PersonalDTO getProfile(Integer userId) {
        System.out.println("====피로필 impl");
        PersonalDTO profile = personalDashMapper.getProfile(userId);
        System.out.println("profile;;;;::::   "+ profile);
        return null;
    }
}
