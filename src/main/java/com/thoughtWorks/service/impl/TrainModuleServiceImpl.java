package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.entity.CourseModule;
import com.thoughtWorks.service.TrainModuleService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TrainModuleServiceImpl implements TrainModuleService {

    @Resource
    private TrainModuleDao trainModuleDao;

    @Override
    public List<Map<String, String>> queryUserRoleList(PageUtil page) throws Exception{
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", (page.getCurrentIndex() - 1) * page.getPageSize() + page.getPageSize());
        page.setTotalSize(trainModuleDao.queryUserRoleTotalCount());

        return trainModuleDao.queryUserRoleList(data);
    }

    @Override
    public void insert(CourseModule courseModule) throws Exception {
        trainModuleDao.insert(courseModule);
    }

    @Override
    public void update(CourseModule courseModule) throws Exception {
        trainModuleDao.update(courseModule);
    }

    @Override
    public void delete(String id) throws Exception {
        trainModuleDao.delete(id);
    }
}
