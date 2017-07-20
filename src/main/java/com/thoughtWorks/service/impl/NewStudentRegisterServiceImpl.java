package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.NewStudentRegisterDao;
import com.thoughtWorks.dao.ReportDao;
import com.thoughtWorks.service.NewStudentRegisterService;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.reportUtil.NewStudentRegisterReportUtil;
import com.thoughtWorks.util.reportUtil.ProfessionReportUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NewStudentRegisterServiceImpl implements NewStudentRegisterService {

    @Resource
    private NewStudentRegisterDao newStudentRegisterDao;


    @Override
    public Map<String, Object> queryStudentByNo(String no) throws Exception {
        Map<String, Object> studentInfo = new HashMap<>();
        Map<String, Object> basicStudentInfo = newStudentRegisterDao.queryRegisterBasicInfo(no);
        List<Map<String, String>> experience = newStudentRegisterDao.queryStudentExperience(no);
        List<Map<String, String>> family = newStudentRegisterDao.queryStudentFamily(no);

        studentInfo.put("basicStudentInfo", basicStudentInfo);
        studentInfo.put("experience", experience);
        studentInfo.put("family", family);

        return studentInfo;
    }

    @Override
    public File exportRegisterReport(HttpServletRequest request) throws Exception {
        Map<String, String> headers = new HashMap<>();
        headers.put("fenyuan", "高职学院");
        headers.put("professionName", "酒店管理");
        headers.put("classesName","酒店管理1708班");
        headers.put("no", "123712987123");
        headers.put("in_time", "1990-2-2");
        String fileName = "高职学院学生入学登记表.xls";

        List<Map<String, Object>> dataSet = new ArrayList<>();
        Map<String, Object> data = new HashMap<>();
        data.put("headImage",request.getServletContext().getRealPath("images/user") + "/user.jpg");
        dataSet.add(data);
        String path = request.getServletContext().getRealPath("images/temp") + "/" + fileName;
        File file = new File(path);
        new NewStudentRegisterReportUtil().exportExcel(headers, dataSet, file, fileName.substring(0, fileName.lastIndexOf(".")));

        return file;
    }

  }
