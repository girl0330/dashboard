package com.job.dashboard.domain.file;

import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.exception.CustomException;
import com.job.dashboard.exception.ExceptionErrorCode;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
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
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileService {
    private final SessionUtil sessionUtil;
    private final FileMapper fileMapper;

    //파일 인스턴스 변수들
    @Value("${image.upload.dir}")
    private String uploadFolder; //yml에 작성한 업로드한 파일위치
    private String rootPath = System.getProperty("user.dir");  // 루트 경로 불러오기
    private String fileDir = rootPath + "/files/"; // 프로젝트 루트 경로에 있는 files 디렉토리

    //파일 저장  todo: fileUtil을 만들어서 공통으로 관리 (결합성을 낮추기)
    @Transactional
    public Map<String, Object> saveFile(MultipartFile file){

        // 결과 맵 생성
        Map<String, Object> result = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        try {
            // 파일을 저장할 디렉토리가 존재하지 않으면 생성
            Path dirPath = Paths.get(uploadFolder);
            if (!Files.exists(dirPath)) {
                Files.createDirectories(dirPath);
            }

            byte[] bytes = file.getBytes(); // 업로드된 파일의 내용을 바이트 배열로 읽음

            String originalFilename = file.getOriginalFilename();

            Path path = Paths.get(uploadFolder + File.separator + file.getOriginalFilename()); // 경로 생성
            Files.write(path, bytes); // 파일을 경로에 저장

            //파일 확장자
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));

            //파일 사이즈
            Long fileSize = file.getSize();

            Map<String, Object> fileInfo  = new HashMap<>();
            fileInfo .put("fileExtension", fileExtension);
            fileInfo .put("fileSize", fileSize);
            validateFile(fileInfo );

            // 파일 이름으로 쓸 UUID 생성
            String uuid = UUID.randomUUID().toString();
            String[] uuids = uuid.split("-");
            String uniqueName = uuids[0];

            // UUID와 결합
            String savedName = uniqueName + fileExtension; // 저장될 이름

            // 저장된 파일 이름으로 경로 갱신
            Path savedPath = Paths.get(uploadFolder + File.separator + savedName);
            Files.move(path, savedPath); // 원래 경로에서 새로운 이름의 파일 경로로 이동

            // 데이터베이스에 파일 정보 저장
            FileDTO fileDTO = new FileDTO();
            fileDTO.setUserNo(userNo);
            fileDTO.setOriginalFilename(file.getOriginalFilename());
            fileDTO.setSavedFilename(savedName);
            fileDTO.setFilePath(savedPath.toString());
            fileDTO.setFileType(fileExtension);
            fileDTO.setFileSize(fileSize);

            fileMapper.saveImage(fileDTO);

            result.put("url", "/business/uploadedFileGet/" + fileDTO.getFileId()); // 클라이언트에게 반환될 파일 URL
        } catch (IOException | IllegalStateException e) {
            e.printStackTrace();
        }
        return result;
    }

    //파일 유효성 검사
    private void validateFile(Map<String, Object> fileInfo ) throws CustomException {
        String[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
        String fileExtension = (String) fileInfo.get("fileExtension");
        Long fileSize = (Long) fileInfo.get("fileSize");

        String toLowerFileExtension = fileExtension.toLowerCase();

        if (!Arrays.asList(allowedExtensions).contains(toLowerFileExtension)) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"허용되지 않는 파일 형식입니다.");
        }

        long maxSize = 300 * 1024; // 5MB
        if (fileSize > maxSize) {
            throw new CustomException(ExceptionErrorCode.EXCEPTION_MESSAGE,"파일 크기가 허용된 한도를 초과했습니다.");
        }
    }


    // 파일 가져오기
    public byte[] loadFileAsBytes(int fileId) throws IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("fileId",fileId);

        FileDTO file = fileMapper.getFiles(map); //todo: fileId 하나만 담을 건데 왜 map으로?

        Path filePath = Paths.get(uploadFolder + File.separator + file.getSavedFilename());

        if (!Files.exists(filePath)) {
            throw new IOException("File not found: " +  file.getSavedFilename());
        }

        try (InputStream imageStream = new FileInputStream(filePath.toString())) {
            return IOUtils.toByteArray(imageStream);
        }
    }

    //파일 조회하기
    public FileDTO getFile(int userNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("userNo",userNo);

        return fileMapper.getFiles(map);
    }

    //파일 수정
    public void updateFile(MultipartFile file) {
        if (file != null) { //파일이 있음.
            saveFile(file);
        }
    }

    // 파일 삭제
    @Transactional
    public void deleteFile(int fileId) {
        Map<String, Object> map = new HashMap<>();
        map.put("fileId", fileId);

        FileDTO fileInfo = fileMapper.getFiles(map);

        if (fileInfo != null) {
            fileMapper.deleteFile(fileId);

            // 로컬에서 파일 삭제
            String filePathStr = uploadFolder + File.separator + fileInfo.getSavedFilename();
            Path filePath = Paths.get(filePathStr);
            File file = filePath.toFile();

            if (file.delete()) {
                System.out.println("파일이 성공적으로 삭제되었습니다: " + filePath); //todo : ??
            } else {
                System.err.println("파일 삭제 실패: " + filePath);
            }
        } else {
            System.err.println("해당 파일 정보를 찾을 수 없습니다: " + fileId);
        }
    }

}
