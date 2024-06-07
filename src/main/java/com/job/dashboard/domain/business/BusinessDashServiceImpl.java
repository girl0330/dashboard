package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;
    private final SessionUtil sessionUtil;

    //기업 프로필 작성
    public Map<Object, String> saveProfile(CompanyInfoDTO companyInfoDTO) {
        System.out.println("기업 프로필 작성");
        Map<Object, String > map = new HashMap<>();

        int userNo = (int) sessionUtil.getAttribute("userNo");
        companyInfoDTO.setUserNo(userNo);


        //작성된 프로필이 있는지 체크
        List<CompanyInfoDTO> businessProfile = businessDashMapper.checkBusinessProfile(userNo);
        System.out.println("기업 프로필 확인 : "+businessProfile);


        if (businessProfile.isEmpty()){ // 작성된 프로필이 없음.
            int companyIdSeq = businessDashMapper.getCompanyIdSeq(userNo); // 회원의 프로필id 값
            System.out.println("companyIdSeq : "+ companyIdSeq);

            companyInfoDTO.setCompanyId(companyIdSeq); // id값이 null이면 1반환

        } else { // null이 아니면 1
            companyInfoDTO.setCompanyId(businessProfile.get(0).getCompanyId());
            System.out.println("확인: "+ companyInfoDTO);
        }

        businessDashMapper.saveBusinessProfile(companyInfoDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    // 기업프로필 가져오기
    public CompanyInfoDTO getBusinessProfile() {
        int userNo = (int) sessionUtil.getAttribute("userNo");

        return businessDashMapper.getBusinessProfile(userNo);
    }

    // 기업 작성한 공고 리스트
    public List<JobPostDTO> postJobList() {
        System.out.println("공고 리스트 임플=====");

        int userNo = (int) sessionUtil.getAttribute("userNo");

        return businessDashMapper.postJobList(userNo);
    }

    //작성한 공고에 지원한 지원자 리스트
    public List<JobApplicationDTO> applicantList(int jobId) {
        System.out.println("지원한 지원자리스트 임플=====");

        return businessDashMapper.getApplicants(jobId);
    }

    //작성한 공고에 지원한 지원자 상세보기
    public JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId) {
        System.out.println("작성한 공고에 지원한 지원자 상세보기 impl");
        //userNo에 일치한 application정보 가져오기

        return businessDashMapper.getCandidateApplyDetail(userNo, jobId);
    }

    //지원자 채용
    public Map<Object, String> applyCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<Object, String> map = new HashMap<>();
        System.out.println("지원자 채용 impl");

        businessDashMapper.applyCandidate(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "성공적으로 채용했습니다.");

        return map;
    }

    //지원자 채용 취소
    public Map<Object, String> applyCancelCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<Object, String> map = new HashMap<>();
        System.out.println("지원자 채용 impl");

        businessDashMapper.applyCancelCandidate(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "성공적으로 취소했습니다.");

        return map;
    }

}
