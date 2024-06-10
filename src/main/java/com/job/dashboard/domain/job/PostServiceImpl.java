package com.job.dashboard.domain.job;

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
public class PostServiceImpl implements PostService {
    private final PostMapper postMapper;
    private final SessionUtil sessionUtil;

    // 구인 공고 저장
    public Map<String, Object> saveJob(JobPostDTO jobPostDTO) {
        System.out.println("====저장 임플=====");
        Map<String, Object> map = new HashMap<>();

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        jobPostDTO.setUserNo(userNo);
        jobPostDTO.setStatusTypeCode("OPEN"); //CANCELLED(취소) HIRED(채용) OPEN(구인중) CLOSED(채용마감)
        System.out.println("dto 확인하기 : " + jobPostDTO);

        postMapper.saveJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 목록
    public List<JobPostDTO> jobList() {
        System.out.println("====공고리스트 impl입니다.====");
        return postMapper.getJobLists();
    }

    // 구인 공고 상세페이지
    public JobPostDTO detail(int jobId) {
        System.out.println("====상세페이지 impl 입니다. ====");


        return postMapper.getJobDetail(jobId);
    }

    // 구인 공고 수정
    public Map<String, Object> update(int userNo, JobPostDTO jobPostDTO) {
        Map<String, Object> map = new HashMap<>();
        postMapper.updateJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 삭제
    public void delete(int jobId) {
        System.out.println("삭제 임플?!");

        postMapper.delete(jobId);
    }

    // 공고 지원
    public Map<String, Object> applyJob(JobApplicationDTO jobApplicationDTO) {

        Map<String, Object> map = new HashMap<>();

        System.out.println("sessionUtil.getAttribute::    "+sessionUtil.getAttribute("userNo"));

        //로그인 확인
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            map.put("code", "loginError");
            map.put("message","로그인이 필요합니다.");
            return map;
        }

        int userNo = (int) sessionUtil.getAttribute("userNo");

        //지원하기 누르면 프로필작성 확인
        int profileExistCheck = postMapper.profileExistCheck(userNo);
        System.out.println("프로필작성 되어있으면=1, 아니면=0 : ?"+profileExistCheck);
        if (profileExistCheck == 0) {
            map.put("code", "profileError");
            map.put("message","프로필 작성 후 이용해주세요."); //프로필 작성 화면으로 이동 시킬까? 그냥 메시지만 띄울까?
            return map;
        }

        jobApplicationDTO.setUserNo(userNo);
        System.out.println("jobApplicationDTO 확인: "+ jobApplicationDTO); //지원 공고 id, 지원내용, userNo


        //중복지원인지 확인 select count(1) from table where 조건=1 and 조건=2
        int applyCheck = postMapper.applyCheck(jobApplicationDTO);
        if (applyCheck == 1) {
            map.put("code", "applyError");
            map.put("message", "이미 지원 하셨습니다.");
            return map;
        }

        System.out.println("지원했음.");

        jobApplicationDTO.setUserNo(userNo);
        jobApplicationDTO.setStatusTypeCode("APPLIED"); //CANCELLED : 지원취소, APPLIED : 지원중

        //insert
        postMapper.insertJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "지원 성공!");
        return map;
    }

    //공고취소하기
    public Map<String, Object> applyCancelJob(Integer jobId) {
        Map<String, Object> map = new HashMap<>();

        //로그인 확인
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            map.put("code", "loginError");
            map.put("message","로그인이 필요합니다.");
            return map;
        }

        int userNo = (int) sessionUtil.getAttribute("userNo");

        int applicationUserChe = postMapper.applicationUserChe(userNo); // userNo가 지원했는지 찾음. (지원 = 1, 지원 안함 = 0)
        System.out.println("유저가 지원했어? "+ applicationUserChe);
        if (applicationUserChe == 0) {
            map.put("code", "error");
            map.put("message","지원 이력이 없습니다.");
            return map;
        }

        JobApplicationDTO jobApplicationDTO = new JobApplicationDTO();

        jobApplicationDTO.setJobId(jobId);
        jobApplicationDTO.setUserNo(userNo);

        postMapper.deleteJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message","지원이 성공적으로 취소되었습니다.");
        return map;
    }
}
