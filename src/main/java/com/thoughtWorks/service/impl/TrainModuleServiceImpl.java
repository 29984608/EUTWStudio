package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.entity.Classes;
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
    public List<Map<String, String>> queryTrainModuleList(PageUtil page) throws Exception{
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", page.getPageSize());
        page.setTotalSize(trainModuleDao.queryTrainModuleTotalCount());

        return trainModuleDao.queryTrainModuleList(data);
    }

    @Override
    public List<Classes> queryClassesList(PageUtil page) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", page.getPageSize());
        page.setTotalSize(trainModuleDao.queryClassesTotalCount());

        return trainModuleDao.queryClassesList(data);
    }

    @Override
    public void insertCourseModule(CourseModule courseModule) throws Exception {
        trainModuleDao.insertCourseModule(courseModule);
    }

    @Override
    public void updateCourseModule(CourseModule courseModule) throws Exception {
        trainModuleDao.updateCourseModule(courseModule);
    }

    @Override
    public void deleteCourseModule(String id) throws Exception {
        trainModuleDao.deleteCourseModule(id);
    }

}
