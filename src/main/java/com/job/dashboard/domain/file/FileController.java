package com.job.dashboard.domain.file;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequiredArgsConstructor
@RequestMapping("/business")
public class FileController {
    private final FileService fileService;

    @PostMapping("/uploadedFile")
    @ResponseBody
    public Map<String, Object> profileFile(@RequestParam("file") MultipartFile file) throws IOException {
        return fileService.saveFile(file);
    }

    //파일 삭제
    @PostMapping("/deleteFile/{fileId}")
    @ResponseBody
    public Map<String, Object> profileFileDelete(@PathVariable("fileId") int fileId){
        Map<String, Object> map = new HashMap<>();
        fileService.deleteFile(fileId);

        map.put("code", "success");
        map.put("message", "프로필 삭제가 되었습니다.");
        return map;
    }

    // fileId로 파일 가져오기
    @GetMapping("/uploadedFileGet/{fileId}")
    public ResponseEntity<byte[]> getImgView(@PathVariable("fileId") int fileId) {
        try {
            byte[] imageByteArray = fileService.loadFileAsBytes(fileId);
            return new ResponseEntity<>(imageByteArray, HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
