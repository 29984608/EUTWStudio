package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Teacher;

import java.util.List;
import java.util.Map;

public interface PersonDao {

    List<Map<String,String>> queryPersonList(Map<String, Object> data);

    Long queryPersonTotalCount();

    void addTeacher(Teacher teacher);

    void updateTeacher(Teacher teacher);

    void deleteTeacherById(String id);

    List<Map<String,String>> queryStudentsByLikes(Map<String, String> data);
}
