package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.service.ReportService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

import static com.thoughtWorks.util.FileUtil.getResponseEntity;

@Component
@RequestMapping("/newStudentRegister")
public class RegisterController {
    @Resource
    private ReportService reportService;


    @RequestMapping("")
    public String newStudentRegisterIndex() {
        return "reportManagement/register/list";
    }


    @RequestMapping("exportRegisterReport")
    public ResponseEntity<byte[]> exportRegisterReport( HttpServletRequest request) throws IOException {
        ResponseEntity<byte[]> responseEntity = null;

        try {
            File file = reportService.exportRegisterReport( request);
            responseEntity = getResponseEntity(file);
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return responseEntity;
    }
}
