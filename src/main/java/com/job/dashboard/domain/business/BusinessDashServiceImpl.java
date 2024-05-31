package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;
    private final SessionUtil sessionUtil;

    //기업 프로필 작성
    public Map<Object, String> saveProfile(BusinessDashDTO businessDashDTO) {
        System.out.println("기업 프로필 작성");
        Map<Object, String > map = new HashMap<>();

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        businessDashDTO.setUserNo(userNo);

        //작성된 프로필이 있는지 체크
        List<BusinessDashDTO> businessProfile = businessDashMapper.checkBusinessProfile(userNo);
        System.out.println("기업 프로필 확인 : "+businessProfile);


        if (businessProfile.isEmpty()){ // 작성된 프로필이 없음.
            int companyIdSeq = businessDashMapper.getCompanyIdSeq(userNo); // 회원의 프로필id 값
            System.out.println("companyIdSeq : "+ companyIdSeq);

            businessDashDTO.setCompanyId(companyIdSeq); // id값이 null이면 +1

        } else { // null이 아니면 1
            businessDashDTO.setCompanyId(businessProfile.get(0).getCompanyId());
            System.out.println("확인: "+ businessDashDTO);
        }

        businessDashMapper.saveBusinessProfile(businessDashDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");
        map.put("coed","update");
        map.put("message", "프로필 업데이트 성공!");

        return map;
    }

    public List PostList(Integer userNo) {
        System.out.println("공고 리스트 임플=====");
        return businessDashMapper.postList(userNo);
    }

}
