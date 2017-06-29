package com.thoughtWorks.service;

import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface PersonService {


    List<Map<String,String>> queryTeachersList(PageUtil page)throws Exception;

    void addTeacher(Teacher teacher, String classIds)throws Exception;

    void updateTeacher(Teacher teacher, String classIds)throws Exception;

    void deleteTeacherById(String id)throws Exception;
}
