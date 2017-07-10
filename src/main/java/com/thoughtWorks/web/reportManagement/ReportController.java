package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.Constant;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/report")
public class ReportController {
    @Resource
    private ReportService reportService;

    @RequestMapping("profession")
    public String professionIndex() {
        return "reportManagement/profession";
    }


    @RequestMapping("direction")
    public String directionIndex() {
        return "reportManagement/direction";
    }

    @RequestMapping("studentInfo")
    public String studentInfoIndex() {
        return "reportManagement/studentInfo";
    }


    @RequestMapping("professionList")
    @ResponseBody
    public Result professionList(String level) {
        try {
            List<Map<String, Object>> data = reportService.professionList(level);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("exportProfessionReport")
    public ResponseEntity<byte[]> exportProfessionReport(String level) throws IOException {
        ResponseEntity<byte[]> responseEntity = null;
        String fileName = "高职学院专业人数统计表 " + (level == null ? "" : level) + ".xls";
        try {
            File file = reportService.exportProfessionReport(level);
            responseEntity = getResponseEntity(fileName, file);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return responseEntity;
    }

    private ResponseEntity<byte[]> getResponseEntity(String fileName, File file) throws IOException {
        String dfileName = new String(fileName.getBytes("utf8"), "iso8859-1");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        return new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

}
