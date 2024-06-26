package com.job.dashboard.domain.business;

import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

public interface BusinessDashService {

    //프로필
    Map<String, Object> saveProfile(CompanyInfoDTO companyInfoDTO); //기업 프로필 작성/수정
    CompanyInfoDTO getBusinessProfile(); //기업 프로필 가져오기


    PageInfo<JobPostDTO> getPostJobList(String keyword, int pageNum, int pageSize); //기업 작성한 공고 리스트


    //작성한 공고
    PageInfo<JobApplicationDTO> getCandidateList(String keyword, int pageNum, int pageSize, int jobId); //지원한 지원자 리스트
    JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId); //지원자 상세보기

    //채용
    Map<String, Object> applyCandidate(JobApplicationDTO jobApplicationDTO);
    Map<String, Object> applyCancelCandidate(JobApplicationDTO jobApplicationDTO);     //채용 취소

    //파일
    Map <String, Object> saveFile(MultipartFile file) throws IOException; //파일 저장
    byte[] loadFileAsBytes(int fileId) throws IOException; // 파일 가져오기
    FileDTO getFile(int userNo); //파일 조회하기
    void deleteFile(int fileId);// 파일 삭제
}
