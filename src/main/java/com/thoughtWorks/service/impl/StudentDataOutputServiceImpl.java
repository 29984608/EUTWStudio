package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.StudentDataOutputDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.StudentUpdate;
import com.thoughtWorks.service.StudentDataOutputService;
import com.thoughtWorks.util.reportUtil.StudentDataOutputReportUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentDataOutputServiceImpl implements StudentDataOutputService {
    @Resource
    private StudentDataOutputDao studentDataOutputDao;
    @Override
    public List<Map<String, Object>> queryStudentList(SearchDto searchDto) throws Exception {
        Map<String, Object> data = new HashMap<>();
        searchDto.setStudentNo("%" + searchDto.getStudentNo() + "%");
        searchDto.setName("%" + searchDto.getName() + "%");
        searchDto.setRoomId("%" + searchDto.getRoomId() + "%");
        if (searchDto.getSex() == null) {
            searchDto.setSex("%" + "%");
        } else {
            searchDto.setSex("%" + searchDto.getSex() + "%");
        }

        if (searchDto.getTypeOfAccommodation() == null) {
            searchDto.setTypeOfAccommodation("");
        } else {
            searchDto.setTypeOfAccommodation(searchDto.getTypeOfAccommodation());
        }
        data.put("searchDto", searchDto);

        return studentDataOutputDao.queryStudentList(data);
    }

    @Override
    public File newStudentDataOutput(HttpServletRequest request, List<Map<String, Object>> exportedData, StudentUpdate studentUpdate) {
        try {
            StudentDataOutputReportUtil studentDataOutputReportUtil = new StudentDataOutputReportUtil();
            Map<String, String> headers = studentDataOutputReportUtil.setTheHeader(studentUpdate);
            String fileName = "学生数据报表.xls";
            String path = request.getServletContext().getRealPath("images/temp") + "/" + fileName;
            File file = new File(path);
            new StudentDataOutputReportUtil().exportExcel(headers, exportedData, file, fileName.substring(0, fileName.lastIndexOf(".")));

            return file;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
