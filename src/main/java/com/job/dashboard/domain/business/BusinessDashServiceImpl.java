package com.job.dashboard.domain.business;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.*;
import com.job.dashboard.domain.file.FileMapper;
import com.job.dashboard.domain.file.FileService;
//import com.job.dashboard.domain.notification.NotificationService;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import static org.flywaydb.core.internal.util.StringUtils.getFileExtension;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;
    private final SessionUtil sessionUtil;
//    private final NotificationService notificationService;
    private final FileMapper fileMapper;
    private final FileService fileService;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    //기업 프로필 작성
    @Transactional
    public ApiResponse insertProfile(CompanyInfoDTO companyInfoDTO) {

        int userNo = (int) sessionUtil.getAttribute("userNo");
        companyInfoDTO.setUserNo(userNo);

        //파일 아이디 조회
        if(companyInfoDTO.getFile() != null) {
            fileMapper.deleteFile(companyInfoDTO.getFileId());
        }

        //list로 프로필 가져옴
        List<CompanyInfoDTO> businessProfileList = businessDashMapper.getBusinessProfileList(userNo);

        if (businessProfileList.isEmpty()){ // 작성된 프로필이 없음.
            int companyIdSeq = businessDashMapper.getCompanyIdSeq(userNo); // 프로필 pk
            companyInfoDTO.setCompanyId(companyIdSeq); // pk 등록

        } else { // 작성된 프로필이 있음
            companyInfoDTO.setCompanyId(businessProfileList.get(0).getCompanyId()); //pk 등록
        }

        // 프로필 내용 작성, 수정
        businessDashMapper.insertProfile(companyInfoDTO);

        // 파일 저장 부분
        fileService.updateFile(companyInfoDTO.getFile());

        return ApiResponse.builder()
                .code(200)
                .message("프로필이 성공적으로 저장되었습니다.")
                .build();
    }

    // 기업 프로필 가져오기
    public CompanyInfoDTO getBusinessProfileInfo() {
        int userNo = (int) sessionUtil.getAttribute("userNo");

        CompanyInfoDTO companyInfo = businessDashMapper.getBusinessProfileInfo(userNo);

        FileDTO file = fileService.getFile(userNo);
        if (file != null){
            companyInfo.setFileDTO(file);
        }

        return companyInfo;
    }

    public ApiResponse changePassword(UserDTO userDTO) {
        String currentPassword = userDTO.getPassword();

        String savedPassword = businessDashMapper.getSavedPassword(userDTO.getUserNo());

        boolean pwCheck = passwordEncoder.matches(currentPassword, savedPassword);
        if (!pwCheck) {
            throw new CustomException(ExceptionErrorCode.PASSWORD_INCORRECT_TOKEN);
        }

        if (!Objects.equals(userDTO.getPassword2(), userDTO.getNewPassword())) {
            throw new CustomException(ExceptionErrorCode.NEW_PASSWORD_MISMATCH_TOKEN);
        }

        String encodedPassword = passwordEncoder.encode(userDTO.getPassword2());
        userDTO.setPassword(encodedPassword);

        businessDashMapper.updatePassword(userDTO);

//        return null;
        return ApiResponse.builder()
                .code(200)
                .message("비밀번호가 성공적으로 재설정 되었습니다.")
                .data(userDTO)
                .build();
    }

    // 기업 작성한 공고 리스트
     public PageInfo<JobPostDTO> getPostJobList(String keyword, int pageNum, int pageSize) {
         Map<String, Object> map = new HashMap<>();
         int userNo = (int) sessionUtil.getAttribute("userNo");

         map.put("userNo", userNo);
         map.put("keyword", keyword);

         PageHelper.startPage(pageNum, pageSize);
         List<JobPostDTO> applyStatusList = businessDashMapper.getPostJobList(map);
         return new PageInfo<>(applyStatusList);
     }


    //작성한 공고에 지원한 지원자 리스트
    public PageInfo<JobApplicationDTO> getCandidateList(String keyword, int pageNum, int pageSize, int jobId) {

        Map<String, Object> map = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);
        map.put("jobId", jobId);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> candidateList = businessDashMapper.getCandidateList(map);
        return new PageInfo<>(candidateList);
    }

    //작성한 공고에 지원한 지원자 상세보기
    public JobApplicationDTO getCandidateDetailInfo(int userNo, int jobId) {
        //userNo에 일치한 application정보 가져오기
        return businessDashMapper.getCandidateDetailInfo(userNo, jobId);
    }

    //지원자 채용
    @Transactional
    public ApiResponse employCandidate(JobApplicationDTO jobApplicationDTO) {
        businessDashMapper.employCandidate(jobApplicationDTO);
//        int userNo = (int)sessionUtil.getAttribute("userNo");

        // jobId로 공고 제목 가져오기
        JobPostDTO jobPost = businessDashMapper.getJobPostTitle(jobApplicationDTO.getJobId());
        int userNo = jobApplicationDTO.getUserNo(); //지원자 userNo

        /** "맥도날드가 채용하였습니다." */

//        notificationService.notification(userNo, "님이" + jobPost.getTitle()+"에 채용하였습니다.","hir"); // (지원자한테 표시할 내용.)

        return ApiResponse.builder()
                .code(200)
                .message("성공적으로 채용했습니다.")
                .build();
    }

    //지원자 채용 취소
    @Transactional
    public ApiResponse cancelEmployCandidate(JobApplicationDTO jobApplicationDTO) {

        int userNo = jobApplicationDTO.getUserNo(); //지원한 userNo(수신자)
        JobPostDTO jobPost = businessDashMapper.getJobPostTitle(jobApplicationDTO.getJobId());
//        notificationService.notification(userNo, "\"" + jobPost.getTitle() + "\"에 채용이 취소되었습니다.","hir"); // (개인유저한테 알려줘야함.)

        return ApiResponse.builder()
                .code(200)
                .message("성공적으로 취소했습니다.")
                .build();
    }

}
