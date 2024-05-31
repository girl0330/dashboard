package com.job.dashboard.domain.job;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
    private final PostMapper postMapper;
    private final SessionUtil sessionUtil;

    // 구인 공고 저장
    public Map<Object, Object> saveJob(JobPostDTO jobPostDTO) {
        System.out.println("====저장 임플=====");
        Map<Object, Object> map = new HashMap<>();

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        jobPostDTO.setUserNo(userNo);
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
    public Map<Object, Object> update(int userNo, JobPostDTO jobPostDTO) {
        Map<Object, Object> map = new HashMap<>();
        postMapper.updateJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    /*jobid를 가지고 해당 dto를 담는다.
     * jobId로 작성자를 writeUserNo로 가져온다.
     * writeUserNo와 로그인 userNo가 일치하면 삭제
     * */
    // 구인 공고 삭제
//    public Map<Object, Object> delete(int jobId, Integer userNo) {
//        Map<Object, Object> map = new HashMap<>();
//        businessDashMapper.delete(jobId);
//        System.out.println("삭제했다?!");
//        map.put("code", "success");
//        map.put("message", "게시글 작성 성공!");
//        return map;
//    }

    // 구인 공고 삭제
    public Map<Object, Object> delete(int jobId) {
        System.out.println("삭제 임플?!");
        Map<Object, Object> map = new HashMap<>();

        postMapper.delete(jobId);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 공고 지원
    public Map<String, Object> applyJob(Integer jobId) {

        Map<String, Object> map = new HashMap<>();

        //로그인 확인
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            map.put("code", "loginError");
            map.put("message","로그인이 필요합니다.");
            return map;
        }

        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");
        //프로필 확인(체크)
        int profileCount = postMapper.profileCount(userNo);
        //프로필값이 없으면 erorr, ajax
        if(profileCount == 0) {
            map.put("code", "profileError");
            map.put("message", "등록된 프로필이 없습니다.");
            return map;
        }

        JobApplicationDTO jobApplicationDTO = new JobApplicationDTO();
        jobApplicationDTO.setJobId(jobId);
        jobApplicationDTO.setUserNo(userNo);
        jobApplicationDTO.setStatusTypeCode("APPLY"); //APPLY:지원중, CLOSE:마감, HIRE:채용
        jobApplicationDTO.setSystemRegisterId(userNo);
        jobApplicationDTO.setSystemUpdaterId(userNo);
        System.out.println("jobApplicationDTO 확인: "+ jobApplicationDTO);

        //중복지원인지 확인 select count(1) from table where 조건=1 and 조건=2
        int applyCheck = postMapper.applyCheck(jobApplicationDTO);
        if (applyCheck == 1) {
            map.put("code", "applyError");
            map.put("message", "이미 지원 하셨습니다.");
            return map;
        }

        System.out.println("지원했음.");

        //insert
        postMapper.insertJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "지원 성공!");
        return map;
    }
}
