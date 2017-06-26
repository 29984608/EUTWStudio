package com.thoughtWorks.service;

import com.thoughtWorks.entity.CourseModule;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface TrainModuleService {
    List<Map<String,String>> queryUserRoleList(PageUtil page)throws Exception;

    void insert(CourseModule courseModule)throws Exception;

    void update(CourseModule courseModule)throws Exception;

    void delete(String id)throws Exception;
}
