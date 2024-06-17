package com.job.dashboard.domain.dto;

import lombok.Data;

@Data
public class FileDTO {
        private int fileId;
        private int userNo;
        private String originalFilename;
        private String savedFilename;
        private String filePath;
        private String fileType;
        private Long fileSize;
        private int systemRegisterId;
        private String systemRegisterDatetime;
}