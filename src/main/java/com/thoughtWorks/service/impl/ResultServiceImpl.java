package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ResultDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ResultService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResultServiceImpl implements ResultService {

    @Resource
    private ResultDao resultDao;

    @Override
    public List<Map<String, String>> querySearchList(SearchDto searchDto, PageUtil pageUtil) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("courseCode", searchDto.getCourseCode());
        data.put("courseName", "%" + searchDto.getCourseName() + "%");
        data.put("lessThanScore", searchDto.getLessThanScore());
        data.put("moreThanScore", searchDto.getMoreThanScore());
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getPageSize());
        pageUtil.setTotalSize(resultDao.querySearchStudentsTotalCountLikes(data));

        return resultDao.querySearchStudentsLikes(data);
    }
}
