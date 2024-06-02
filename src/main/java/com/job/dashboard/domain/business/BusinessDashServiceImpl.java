package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.BusinessDashDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
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

        return map;
    }

    // 기업프로필 가져오기
    public BusinessDashDTO getBusinessProfile() {
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        return businessDashMapper.getBusinessProfile(userNo);
    }

    // 기업 작성한 공고 리스트
    public List<JobPostDTO> postJobList() {
        System.out.println("공고 리스트 임플=====");

        int userNo =(int) sessionUtil.getAttribute("userNo");

        return businessDashMapper.postJobList(userNo);
    }

    //작성한 공고에 지원한 지원자리스트
    public List<JobApplicationDTO> applicantList(int jobId) {
        System.out.println("지원한 지원자리스트 임플=====");

        //지원자들의 userNo가져옴
        JobApplicationDTO applicants = businessDashMapper.getApplicants(jobId);
        System.out.println("지원자리스트로 가져왔는지 확인: "+applicants);

        // 지원자의 userNo로 지원자들의 정보를 Applicants
        List<JobApplicationDTO> applicantsList = businessDashMapper.getApplicantsList(applicants);
        System.out.println("applicantList"+applicantsList);
        return null;
    }

}
