package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.CommunicationContent;
import com.thoughtWorks.entity.Student;
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

    List<Map<String,String>> queryStudentsByClassesIdsAndLikeName(@Param("name") String name, @Param("classes") List<Classes> classes,@Param("no") String no);

    Student queryStudentByNo(String stuNo);

    void addCommunication(CommunicationContent content);

    List<Map<String, Object>> queryCommunicationByStudentId(String studentNo);

    void updateCommunicationContent(CommunicationContent communicationContent);

    void distributeDirection(@Param("directionId") String directionId, @Param("ids") List<String> ids);

    List<Map<String,Object>> queryStudentList(Map<String, Object> data);

    Long queryStudentTotalCount(String name);

    List<Map<String,Object>> queryAllDept(Map<String, Object> data);

    Long queryDeptTotalCount();

    void addDept(String name);

    void updateDept(Map<String, Object> data);

    void deleteDept(String id);
}
