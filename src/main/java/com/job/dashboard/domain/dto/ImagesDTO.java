package com.job.dashboard.domain.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ImagesDTO {
        private int id;
        private int companyId;
        private String originalFilename;
        private String savedFilename;
        private String filepath;
        private String filetype;
        private int systemRegisterId;
        private String systemRegisterDatetime;
        private int systemUpdaterId;
        private String systemUpdateDatetime;
}
