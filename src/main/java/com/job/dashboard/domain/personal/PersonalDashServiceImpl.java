package com.job.dashboard.domain.personal;

import com.job.dashboard.domain.dto.PersonalDashDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PersonalDashServiceImpl implements PersonalDashService{
    private final PersonalDashMapper personalDashMapper;

    //프로필이 저장 유무
    public Boolean profileCheck(Integer userId) {
        System.out.println("프로필 유무 체크");
        boolean profileCheck;
        int x = personalDashMapper.profileCheck(userId);
        System.out.println("x ::::   "+x);
        profileCheck = x > 0;

        return profileCheck;
    }

    public PersonalDashDTO getProfile(Integer userId) {
        System.out.println("====피로필 impl");
        PersonalDashDTO profile = personalDashMapper.getProfile(userId);
        System.out.println("profile;;;;::::   "+ profile);
        return profile;
    }
    @Transactional
    public Map<Object, String> saveProfile(PersonalDashDTO personalDashDTO, HttpSession session) {
        System.out.println("======impl====");
        Map<Object,String> map = new HashMap<>();
        int userId = (int)session.getAttribute("userId");

        List<PersonalDashDTO> profile = personalDashMapper.checkProfile(userId);

        int x = profile.size();

        if (x == 0) {
            int profileSeq = personalDashMapper.getProfileIdSeq(userId);
            personalDashDTO.setProfileId(profileSeq);
        }else{
            personalDashDTO.setProfileId(profile.get(0).getProfileId());
        }
        personalDashDTO.setUserId(userId);

        //pk가 없으면 insert 있으면 update
        personalDashMapper.saveProfile(personalDashDTO);


        map.put("code","success");
        map.put("message","프로필 저장 성공!");

        return map;
    }
}
