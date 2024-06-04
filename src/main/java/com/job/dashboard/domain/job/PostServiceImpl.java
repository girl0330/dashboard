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

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        JobApplicationDTO jobApplicationDTO = new JobApplicationDTO();

        jobApplicationDTO.setJobId(jobId);
        jobApplicationDTO.setUserNo(userNo);

        postMapper.deleteJobApplicationInfo(jobApplicationDTO);
        map.put("code", "delete");
        map.put("message","지원이 성공적으로 취소되었습니다.");
        return map;
    }
}
