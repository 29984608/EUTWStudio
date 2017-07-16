package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ResultReportDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ResultReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResultReportServiceImpl implements ResultReportService {

    @Resource
    private ResultReportDao resultReportDao;


    @Override
    public List<Map<String, String>> showResultReportList(SearchDto searchDto) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("departmentId", searchDto.getDepartmentId());
        data.put("level", searchDto.getLevel());
        data.put("directionId", searchDto.getDirectionId());
        data.put("classesId", searchDto.getClassesId());
        data.put("no", searchDto.getStudentNo() + "%");
        data.put("name", "%" + searchDto.getName() + "%");

        return resultReportDao.queryStudentsLikes(data);
    }
}
