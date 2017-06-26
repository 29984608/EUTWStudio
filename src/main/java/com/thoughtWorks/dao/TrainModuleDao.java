package com.thoughtWorks.dao;

import com.thoughtWorks.entity.CourseModule;

import java.util.List;
import java.util.Map;

public interface TrainModuleDao {
    Long queryUserRoleTotalCount();

    List<Map<String,String>> queryUserRoleList(Map<String, Object> data);

    void insert(CourseModule courseModule);

    void update(CourseModule courseModule);

    void delete(String id);
}
