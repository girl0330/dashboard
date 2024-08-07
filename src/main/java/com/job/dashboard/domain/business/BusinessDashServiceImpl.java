package com.job.dashboard.domain.business;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.domain.notification.NotificationService;
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
import java.util.*;

import static org.flywaydb.core.internal.util.StringUtils.getFileExtension;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;
    private final SessionUtil sessionUtil;
    private final NotificationService notificationService;

    //파일 인스턴스 변수들
    @Value("${image.upload.dir}")
    private String uploadFolder; //yml에 작성한 업로드한 파일위치
    private String rootPath = System.getProperty("user.dir");  // 루트 경로 불러오기
    private String fileDir = rootPath + "/files/"; // 프로젝트 루트 경로에 있는 files 디렉토리

    //기업 프로필 작성
    @Transactional
    public Map<String, Object>  insertProfile(CompanyInfoDTO companyInfoDTO) {
        Map<String, Object> map = new HashMap<>();

        int userNo = (int) sessionUtil.getAttribute("userNo");
        companyInfoDTO.setUserNo(userNo);

        //파일 아이디 조회
        if(companyInfoDTO.getFile() != null) {
            deleteFile(companyInfoDTO.getFileId());
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
        MultipartFile fileCheck = companyInfoDTO.getFile();
        if (fileCheck != null) { //파일이 있음.

            map = saveFile(fileCheck);
        }

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    // 기업 프로필 가져오기
    public CompanyInfoDTO getBusinessProfileInfo() {
        int userNo = (int) sessionUtil.getAttribute("userNo");

        return businessDashMapper.getBusinessProfileInfo(userNo);
    }


    //파일 저장
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

            businessDashMapper.saveImage(fileDTO);

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
    @Override
    public byte[] loadFileAsBytes(int fileId) throws IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("fileId",fileId);

        FileDTO file = businessDashMapper.getFiles(map);

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

        return businessDashMapper.getFiles(map);
    }

    // 파일 삭제
    @Transactional
    public void deleteFile(int fileId) {
        Map<String, Object> map = new HashMap<>();
        map.put("fileId", fileId);

        FileDTO fileInfo = businessDashMapper.getFiles(map);

        if (fileInfo != null) {
            businessDashMapper.deleteFile(fileId);

            // 로컬에서 파일 삭제
            String filePathStr = uploadFolder + File.separator + fileInfo.getSavedFilename();
            Path filePath = Paths.get(filePathStr);
            File file = filePath.toFile();

            if (file.delete()) {
                System.out.println("파일이 성공적으로 삭제되었습니다: " + filePath);
            } else {
                System.err.println("파일 삭제 실패: " + filePath);
            }
        } else {
            System.err.println("해당 파일 정보를 찾을 수 없습니다: " + fileId);
        }
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
    public Map<String, Object> employCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<String, Object> map = new HashMap<>();

        businessDashMapper.employCandidate(jobApplicationDTO);

        // jobId로 공고 제목 가져오기
        JobPostDTO jobPost = businessDashMapper.getJobPostTile(jobApplicationDTO.getJobId());
        int userNo = jobApplicationDTO.getUserNo(); //지원한 userNo

        // 공고 제목 가져오기

        notificationService.sendNotification(userNo, jobPost.getTitle()+"에 채용 되었습니다.","hir"); // (개인유저한테 알려줘야함.)

        map.put("code", "success");
        map.put("message", "성공적으로 채용했습니다.");

        return map;
    }

    //지원자 채용 취소
    @Transactional
    public Map<String, Object> cancelEmployCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<String, Object> map = new HashMap<>();

        businessDashMapper.cancelEmployCandidate(jobApplicationDTO);

        int userNo = jobApplicationDTO.getUserNo(); //지원한 userNo
        JobPostDTO jobPost = businessDashMapper.getJobPostTile(jobApplicationDTO.getJobId());
        notificationService.sendNotification(userNo, "\"" + jobPost.getTitle() + "\"에 채용 취소되었습니다.","hir"); // (개인유저한테 알려줘야함.)

        map.put("code", "success");
        map.put("message", "성공적으로 취소했습니다.");

        return map;
    }

}
