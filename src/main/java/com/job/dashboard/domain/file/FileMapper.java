package com.job.dashboard.domain.file;

import com.job.dashboard.domain.dto.FileDTO;
import org.apache.ibatis.annotations.Mapper;

import java.io.IOException;
import java.util.Map;

@Mapper
public interface FileMapper{
    void saveImage(FileDTO fileDTO) throws IOException; //저장
    FileDTO getFiles(Map<String, Object> map); //가져오기
    void deleteFile(int fileId); //삭제
}
