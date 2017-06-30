package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PersonDao {

    List<Map<String,String>> queryPersonList(Map<String, Object> data);

    Long queryPersonTotalCount();

    void addTeacher(Teacher teacher);

    void updateTeacher(Teacher teacher);

    void deleteTeacherById(String id);

    List<Map<String,String>> queryStudentsByLikes(Map<String, String> data);

    Map<String,String> queryTeacherByNo(String userName);

    void distributedClass(@Param("classesId") String classesId, @Param("ids") List<String> ids);
}
