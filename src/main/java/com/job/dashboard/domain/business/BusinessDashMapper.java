package com.job.dashboard.domain.business;

import com.job.dashboard.domain.dto.JobPostDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BusinessDashMapper {

    //게시글 작성
    void saveJob(JobPostDTO jobPostDTO);

    //게시글 목록
    List<JobPostDTO> getJobLists();

    //게시글 상세페이지
    JobPostDTO getJobDetail(int id);

    void updateJob(JobPostDTO jobPostDTO);

    //게시글 수정
}
