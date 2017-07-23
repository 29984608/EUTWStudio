package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.StudentInfoReportDao;
import com.thoughtWorks.service.StudentInfoReportService;
import com.thoughtWorks.util.reportUtil.NewStudentRegisterReportUtil;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class StudentInfoReportServiceImpl implements StudentInfoReportService {

    @Resource
    private StudentInfoReportDao studentInfoReportDao;

    @Override
    public File exportReport(HttpServletRequest request) throws Exception {
        Map<String, Object> studentInfo = null;
        Map<String, Object> basicStudent = (Map<String, Object>) studentInfo.get("basicStudentInfo");
        basicStudent.put("head_image", request.getServletContext().getRealPath("images/user") + "/" + basicStudent.get("head_image") + "");
        Map<String, String> headers = new HashMap<>();
        headers.put("fenyuan", "高职学院");
        headers.put("professionName", basicStudent.get("professionName") + "");
        headers.put("classesName", basicStudent.get("classesName") + "");
        headers.put("no", basicStudent.get("no") + "");
        headers.put("in_school", basicStudent.get("in_school") + "");
        String fileName = "高职学院学生入学登记表(" + headers.get("no") + ").xls";

        List<Map<String, Object>> dataSet = new ArrayList<>();
        dataSet.add(studentInfo);
        String path = request.getServletContext().getRealPath("images/temp") + "/" + fileName;
        File file = new File(path);
        new NewStudentRegisterReportUtil().exportExcel(headers, dataSet, file, fileName.substring(0, fileName.lastIndexOf(".")));

        return file;
    }

    @Override
    public List<Map<String, Object>> studentInfoList() throws Exception {
        return studentInfoReportDao.studentInfoList();
    }
}
