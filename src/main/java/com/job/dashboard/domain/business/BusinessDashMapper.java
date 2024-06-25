package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import org.apache.ibatis.annotations.Mapper;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Mapper
public interface BusinessDashMapper {

    // 프로필
    List<CompanyInfoDTO> checkBusinessProfile(int userNo); // 프로필 존재 체크
    int getCompanyIdSeq(int userNo); //프로필 pk
    void saveBusinessProfile(CompanyInfoDTO companyInfoDTO);  // 프로필 작성, 수정
    CompanyInfoDTO getBusinessProfile(int userNo);  // 프로필 가져오기

    //공고 리스트
    List<JobPostDTO> getPostJobList (Map<String, Object> map);

    //지원자
    List<JobApplicationDTO> getCandidateList(Map<String, Object> map); //정보 리스트
    JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId); //상세보기
    void applyCandidate(JobApplicationDTO jobApplicationDTO); //채용
    void applyCancelCandidate(JobApplicationDTO jobApplicationDTO); //채용 취소

    //파일
    void saveImage(FileDTO fileDTO) throws IOException; //저장
    FileDTO getFiles(Map<String, Object> map); //가져오기
    void deleteFile(int fileId); //삭제

    //사업자 번호 체크
    int checkBusinessNumByUserNo(int userNo);
}
