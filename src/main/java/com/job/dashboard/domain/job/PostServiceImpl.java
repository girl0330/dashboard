package com.job.dashboard.domain.job;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.dto.LikeDTO;
import com.job.dashboard.domain.dto.UserProfileInfoDTO;
import com.job.dashboard.domain.notification.NotificationService;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
    private final PostMapper postMapper;
    private final SessionUtil sessionUtil;
    private final NotificationService notificationService;

    //프로필 확인
    public int profileCheck(int userNo) {
        return postMapper.profileCount(userNo);
    }

    // 구인 공고 저장
    @Transactional
    public Map<String, Object> insertPost(JobPostDTO jobPostDTO) {
        Map<String, Object> map = new HashMap<>();

        int userNo = (int) sessionUtil.getAttribute("userNo");
        jobPostDTO.setUserNo(userNo);
        jobPostDTO.setStatusTypeCode("OPEN"); //CANCELLED(취소) HIRED(채용) OPEN(구인중) CLOSED(채용마감)

        postMapper.insertPost(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 목록
    public PageInfo<JobPostDTO> jobList(String keyword, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        List<JobPostDTO> list = postMapper.getJobLists(keyword);

        return new PageInfo<>(list);
    }

    //likeList
    public List<LikeDTO> getLikeList() {

        if (sessionUtil.loginUserCheck()) { // 로그인 여부 체크
            int userNo = (int) sessionUtil.getAttribute("userNo");
            return postMapper.getLikeList(userNo);
        } else {
            return Collections.emptyList();
        }
    }

    // 구인 공고 상세페이지
    public JobPostDTO getJobPostDetailInfo(int jobId) {

        return postMapper.getJobPostDetailInfo(jobId);
    }

    //like
    public int findLike(Map<String, Object> map) {

        return postMapper.findLike(map);
    }

    //좋아요 관리
    @Transactional
    public Map<String, Object> likeControl(int jobId, HttpServletRequest request) {

        Map<String, Object> map = new HashMap<>();

        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            map.put("code", "error");
            map.put("message", "로그인 후 이용해 주세요");
            String currentUrl = request.getRequestURL().toString();
            request.getSession().setAttribute("prevPage", currentUrl);
            return map;
        }

        int userNo = (int) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("jobId", jobId);

        int like = postMapper.findLike(map);
        if(like > 0) {// 좋아요 누른상테
            postMapper.deleteLike(map);
            like = 0;
        } else {
            postMapper.likeUp(map);
            like = 1;
        }

        map.put("like",like);
        map.put("code", "success");
        return map;

    }
    // 구인 공고 수정
    @Transactional
    public Map<String, Object> updateJobPost(int userNo, JobPostDTO jobPostDTO) {
        Map<String, Object> map = new HashMap<>();
        postMapper.updateJobPost(jobPostDTO);
        map.put("code", "success");
        map.put("message", "게시글 작성 성공!");
        return map;
    }

    // 구인 공고 삭제
    @Transactional
    public void deleteJobPost(int jobId) {
        postMapper.updateDeleteY(jobId);
    }

    // 공고 지원
    @Transactional
    public Map<String, Object> applyJobPost(JobApplicationDTO jobApplicationDTO) {

        Map<String, Object> map = new HashMap<>();

        //로그인 확인
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            throw new CustomException(ExceptionErrorCode.UNAUTHORIZED_USER_TOKEN);
        }

        int userNo = (int) sessionUtil.getAttribute("userNo");//세션에서 가져오는 유저번호

        //지원하기 누르면 프로필작성 확인
        int profileExistCheck = postMapper.profileExistCheck(userNo);
        if (profileExistCheck == 0) { // 프로필이 없음.
            throw new CustomException(ExceptionErrorCode.PROFILE_NOT_COMPLETED_TOKEN);
        }

        jobApplicationDTO.setUserNo(userNo);

        jobApplicationDTO.setStatusTypeCode("APPLIED"); // APPLIED : 지원중, CANCELLED : 지원취소

        //공고 작성한 userNo가져오기, 공고 제목가져오기
        JobPostDTO postInfo = postMapper.getPostInfo(jobApplicationDTO.getJobId()); //지원한 공고Id로 공고 작성자 가져옴

        notificationService.sendNotification(postInfo.getUserNo(), postInfo.getTitle()+"에 지원 하셨습니다. ","app"); //(기업 회원한테 보낼 알림)

        //insert
        postMapper.insertJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "지원 성공!");
        return map;
    }

    // 공고 중복 지원 확인
    public Map<String, Object> checkDuplicateApply(JobApplicationDTO jobApplicationDTO) {
        //중복지원인지 확인 select count(1) from table where 조건=1 and 조건=2
        int applycount = postMapper.getApplyCount(jobApplicationDTO.getJobId());
        if (applycount == 1) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"이미 지원 하셨습니다.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("code", "success");
        return map;
    }

    //공고취소하기
    @Transactional
    public Map<String, Object> applyCancelJob(Integer jobId) {
        Map<String, Object> map = new HashMap<>();

        //로그인 확인
        if (!sessionUtil.loginUserCheck()) { // 로그인 체크
            throw new CustomException(ExceptionErrorCode.UNAUTHORIZED_USER_TOKEN);
        }

        int userNo = (int) sessionUtil.getAttribute("userNo");

        int applicationUserChe = postMapper.applicationUserChe(userNo); // userNo가 지원했는지 찾음. (지원 = 1, 지원 안함 = 0)
        if (applicationUserChe == 0) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"지원 이력이 없습니다.");
        }

        JobApplicationDTO jobApplicationDTO = new JobApplicationDTO();

        jobApplicationDTO.setJobId(jobId); // 지원 취소 공고id
        jobApplicationDTO.setUserNo(userNo); // 지원 취소한 userNo

        //공고 작성한 userNo가져오기, 공고 제목가져오기
        JobPostDTO postInfo = postMapper.getPostInfo(jobApplicationDTO.getJobId()); //지원한 공고Id로 공고 작성자 가져옴

        notificationService.sendNotification(postInfo.getUserNo(), postInfo.getTitle()+"에 지원을 취소 하셨습니다. ","app"); //(기업 회원한테 보낼 알림)

        postMapper.deleteJobApplicationInfo(jobApplicationDTO);
        map.put("code", "success");
        map.put("message","지원이 성공적으로 취소되었습니다.");
        return map;
    }

    public JobApplicationDTO getUserStatusCode(Map<String, Object> map) {
        return postMapper.getUserStatusCode(map);
    }

    public int getCountUserStatusCode(Map<String, Object> map) {
        return postMapper.getCountUserStatusCode(map);
    }

//    public int getFile() {
//        return postMapper.getFile();
//    }
    public int getCountJobs() {
        return postMapper.getCountJobs();  // 총 게시물 수를 세는 메서드
    }
}
