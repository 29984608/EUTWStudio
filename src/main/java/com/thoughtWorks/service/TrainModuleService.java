package com.thoughtWorks.service;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.CourseModule;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface TrainModuleService {
    List<Map<String,String>> queryTrainModuleList(PageUtil page)throws Exception;

    void insertCourseModule(CourseModule courseModule)throws Exception;

    void updateCourseModule(CourseModule courseModule)throws Exception;

    void deleteCourseModule(String id)throws Exception;


    List<Classes> queryClassesList(PageUtil page) throws Exception;

}
