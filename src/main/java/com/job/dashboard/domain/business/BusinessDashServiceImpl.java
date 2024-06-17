package com.job.dashboard.domain.business;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.job.dashboard.domain.dto.CompanyInfoDTO;
import com.job.dashboard.domain.dto.FileDTO;
import com.job.dashboard.domain.dto.JobApplicationDTO;
import com.job.dashboard.domain.dto.JobPostDTO;
import com.job.dashboard.util.SessionUtil;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Service
@RequiredArgsConstructor
public class BusinessDashServiceImpl implements BusinessDashService{
    private final BusinessDashMapper businessDashMapper;
    private final SessionUtil sessionUtil;

    @Value("${image.upload.dir}") //yml에 작성한 업로드한 파일위치
    private String uploadFolder;


    // 루트 경로 불러오기
    private String rootPath = System.getProperty("user.dir");
    // 프로젝트 루트 경로에 있는 files 디렉토리
    private String fileDir = rootPath + "/files/";

    //파일 저장
    public Map<Object, String> saveFile(MultipartFile file) throws IOException {
        System.out.println("====프로필 이미지 파일 저장 impl====");

        // 결과 맵 생성
        Map<Object, String> result = new HashMap<>();
        int userNo = (int) sessionUtil.getAttribute("userNo");

        try {
            // 파일을 저장할 디렉토리가 존재하지 않으면 생성
            Path dirPath = Paths.get(uploadFolder);
            if (!Files.exists(dirPath)) {
                Files.createDirectories(dirPath);
            }

            byte[] bytes = file.getBytes(); // 업로드된 파일의 내용을 바이트 배열로 읽음

            String originalFilename = file.getOriginalFilename();
            System.out.println("파일명 : " + originalFilename);

            Long fileSize = file.getSize();

            Path path = Paths.get(uploadFolder + File.separator + file.getOriginalFilename()); // 경로 생성
            Files.write(path, bytes); // 파일을 지정된 경로에 저장

            System.out.println("파일이 저장될 경로 : " + path.toString());

            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            System.out.println("확장자 확인 : " + fileExtension);

            // 파일 이름으로 쓸 UUID 생성
            String uuid = UUID.randomUUID().toString();
            System.out.println(uuid);
            String[] uuids = uuid.split("-");
            String uniqueName = uuids[0];

            // UUID와 결합
            String savedName = uniqueName + fileExtension; // 저장될 이름
            System.out.println("저장될 이름 확인 : " + savedName);

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
            System.out.println("이미지 dto 확인 : " + fileDTO);

            businessDashMapper.saveImage(fileDTO);

            result.put("code", "success");
            result.put("url", "/business/uploadedFileGet/" + fileDTO.getFileId()); // 클라이언트에게 반환될 파일 URL
            System.out.println("result 확인 : "+result);
        } catch (IOException | IllegalStateException e) {
            e.printStackTrace();
            result.put("code", "error");
            result.put("message", "File upload failed: " + e.getMessage());
        }

        return result;
    }

    // 파일 가져오기
    @Override
    public byte[] loadFileAsBytes(int fileId) throws IOException {

        Map<String, Object> map = new HashMap<>();
        map.put("fileId",fileId);
        FileDTO file = businessDashMapper.getFiles(map);
        System.out.println("file확인 ;"+file);

        Path filePath = Paths.get(uploadFolder + File.separator + file.getSavedFilename());

        if (!Files.exists(filePath)) {
            throw new IOException("File not found: " +  file.getSavedFilename());
        }

        try (InputStream imageStream = new FileInputStream(filePath.toString())) {
            return IOUtils.toByteArray(imageStream);
        }
    }

    //기업 프로필 작성
    public Map<Object, String> saveProfile(CompanyInfoDTO companyInfoDTO) {
        System.out.println("기업 프로필 작성");
        Map<Object, String > map = new HashMap<>();

        int userNo = (int) sessionUtil.getAttribute("userNo");
        companyInfoDTO.setUserNo(userNo);


        //작성된 프로필이 있는지 체크
        List<CompanyInfoDTO> businessProfile = businessDashMapper.checkBusinessProfile(userNo);
        System.out.println("기업 프로필 확인 : "+businessProfile);


        if (businessProfile.isEmpty()){ // 작성된 프로필이 없음.
            int companyIdSeq = businessDashMapper.getCompanyIdSeq(userNo); // 회원의 프로필id 값
            System.out.println("companyIdSeq : "+ companyIdSeq);

            companyInfoDTO.setCompanyId(companyIdSeq); // id값이 null이면 1반환

        } else { // null이 아니면 1
            companyInfoDTO.setCompanyId(businessProfile.get(0).getCompanyId());
            System.out.println("확인: "+ companyInfoDTO);
        }

        businessDashMapper.saveBusinessProfile(companyInfoDTO);

        map.put("code", "success");
        map.put("message", "프로필 저장 성공!");

        return map;
    }

    // 기업프로필 가져오기
    public CompanyInfoDTO getBusinessProfile() {
        int userNo = (int) sessionUtil.getAttribute("userNo");

        return businessDashMapper.getBusinessProfile(userNo);
    }

    //파일 가져오기
    public FileDTO getFile(int userNo) {

        Map<String, Object> map = new HashMap<>();
        map.put("userNo",userNo);
        return businessDashMapper.getFiles(map);
    }

    // 기업 작성한 공고 리스트
     public PageInfo<JobPostDTO> getPostJobList(String keyword, int pageNum, int pageSize) {
         System.out.println("공고 리스트 임플=====");

         Map<String, Object> map = new HashMap<>();
         Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

         map.put("userNo", userNo);
         map.put("keyword", keyword);
         System.out.println(" map 에 들어간거 확인 :: "+map);

         PageHelper.startPage(pageNum, pageSize);
         List<JobPostDTO> applyStatusList = businessDashMapper.getPostJobList(map) ;
         return new PageInfo<>(applyStatusList);
     }

    //작성한 공고에 지원한 지원자 리스트
    public PageInfo<JobApplicationDTO> getCandidateList(String keyword, int pageNum, int pageSize, int jobId) {
        System.out.println("지원한 지원자리스트 임플=====");

        Map<String, Object> map = new HashMap<>();
        Integer userNo = (Integer) sessionUtil.getAttribute("userNo");

        map.put("userNo", userNo);
        map.put("keyword", keyword);
        map.put("jobId", jobId);
        System.out.println(" map 에 들어간거 확인 :: "+map);

        PageHelper.startPage(pageNum, pageSize);
        List<JobApplicationDTO> applyStatusList = businessDashMapper.getCandidateList(map);
        return new PageInfo<>(applyStatusList);
    }

    //작성한 공고에 지원한 지원자 상세보기
    public JobApplicationDTO getCandidateApplyDetail(int userNo, int jobId) {
        System.out.println("작성한 공고에 지원한 지원자 상세보기 impl");
        //userNo에 일치한 application정보 가져오기

        return businessDashMapper.getCandidateApplyDetail(userNo, jobId);
    }

    //지원자 채용
    public Map<Object, String> applyCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<Object, String> map = new HashMap<>();
        System.out.println("지원자 채용 impl");

        businessDashMapper.applyCandidate(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "성공적으로 채용했습니다.");

        return map;
    }

    //지원자 채용 취소
    public Map<Object, String> applyCancelCandidate(JobApplicationDTO jobApplicationDTO) {
        Map<Object, String> map = new HashMap<>();
        System.out.println("지원자 채용 impl");

        businessDashMapper.applyCancelCandidate(jobApplicationDTO);
        map.put("code", "success");
        map.put("message", "성공적으로 취소했습니다.");

        return map;
    }

}
