package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.PersonalDashDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService {
    private final BusinessDashMapper businessDashMapper;

    // 구인 공고 저장
    public Map<Object, Object> saveJob(JobPostDTO jobPostDTO, Integer userId) {
        System.out.println("====저장 임플=====");
        Map<Object, Object> map = new HashMap<>();

        jobPostDTO.setUserId(userId);
        System.out.println("dto 확인하기 : " + jobPostDTO);

        businessDashMapper.saveJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 목록
    public List<JobPostDTO> jobList() {
        System.out.println("====공고리스트 impl입니다.====");
        return businessDashMapper.getJobLists();
    }

    // 구인 공고 상세페이지
    public JobPostDTO detail(int id) {
        System.out.println("====상세페이지 impl 입니다. ====");
        return businessDashMapper.getJobDetail(id);
    }

    // 구인 공고 수정
    public Map<Object, Object> update(int userId, JobPostDTO jobPostDTO) {
        Map<Object, Object> map = new HashMap<>();
        businessDashMapper.updateJob(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    /*jobid를 가지고 해당 dto를 담는다.
     * jobId로 작성자를 writeUserId로 가져온다.
     * writeUserId와 로그인 userId가 일치하면 삭제
     * */
    // 구인 공고 삭제
//    public Map<Object, Object> delete(int jobId, Integer userId) {
//        Map<Object, Object> map = new HashMap<>();
//        businessDashMapper.delete(jobId);
//        System.out.println("삭제했다?!");
//        map.put("code", "success");
//        map.put("message", "게시글 작성 성공!");
//        return map;
//    }

    public Map<Object, Object> delete(int jobId, Integer userId) {
        System.out.println("삭제 임플?!");
        Map<Object, Object> map = new HashMap<>();
        businessDashMapper.delete(jobId);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    public Map<String, Object> applyJob(Integer jobId, HttpSession session) {

        Map<String, Object> map = new HashMap<>();

        //로그인 확인
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("userId확인 : "+userId);
        if (userId == null) {
            map.put("code", "loginError");
            map.put("message","로그인이 필요합니다.");
            return map;
        }
        //프로필 확인(체크)
        int profileCount = businessDashMapper.profileCount(userId);
        //프로필값이 없으면 erorr, ajax
        if(profileCount == 0) {
            map.put("code", "profileError");
            map.put("message", "등록된 프로필이 없습니다.");
            return map;
        }

        JobApplicationDTO jobApplicationDTO = new JobApplicationDTO();
        jobApplicationDTO.setJobId(jobId);
        jobApplicationDTO.setUserId(userId);
        jobApplicationDTO.setStatusTypeCode("APPLY"); //APPLY:지원중, CLOSE:마감, HIRE:채용
        jobApplicationDTO.setSystemRegisterId(userId);
        jobApplicationDTO.setSystemUpdaterId(userId);
        System.out.println("jobApplicationDTO 확인: "+ jobApplicationDTO);
        //중복지원인지 확인이 필요하잖아~! select count(1) from table where 조건=1 and 조건=2
        int applyCheck = businessDashMapper.applyCheck(jobApplicationDTO);
        if (applyCheck == 1) {
            map.put("code", "applyDubleError");
            map.put("message", "이미 지원 하셨습니다.");
            return map;
        }
        System.out.println("지원됨");

        //insert
        businessDashMapper.insertJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "지원 성공!");
        return map;
    }
}
