package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.CourseModule;

import java.util.List;
import java.util.Map;

public interface TrainModuleDao {
    Long queryTrainModuleTotalCount();

    List<Map<String,String>> queryTrainModuleList(Map<String, Object> data);

    void insertCourseModule(CourseModule courseModule);

    void updateCourseModule(CourseModule courseModule);

    void deleteCourseModule(String id);

    Long queryClassesTotalCount();


    List<Classes> queryClassesList(Map<String, Object> data);

    void deleteClasses(String id);

    void updateClasses(Classes classes);

    void addClassesManual(Classes classes);
}
