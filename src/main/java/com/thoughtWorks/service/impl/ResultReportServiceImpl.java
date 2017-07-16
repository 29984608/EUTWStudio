package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ResultReportDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ResultReportService;
import com.thoughtWorks.util.PageUtil;
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
    public List<Map<String, String>> showResultReportList(SearchDto searchDto, PageUtil pageUtil) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("departmentId", searchDto.getDepartmentId());
        data.put("level", searchDto.getLevel());
        data.put("directionId", searchDto.getDirectionId());
        data.put("classesId", searchDto.getClassesId());
        data.put("no", searchDto.getStudentNo() + "%");
        data.put("name", "%" + searchDto.getName() + "%");
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("end", pageUtil.getPageSize());
        pageUtil.setTotalSize(resultReportDao.queryStudentsLikesTotalCount(data));

        return resultReportDao.queryStudentsLikes(data);
    }

    @Override
    public Map<String, String> queryStudentByNo(String no) throws Exception {
        return resultReportDao.queryStudentByNo(no);
    }

    @Override
    public List<Map<String,String>> queryStudentCourseResultByNo(String no) throws Exception {
        return resultReportDao.queryStudentCourseResultByNo(no);
    }
}
