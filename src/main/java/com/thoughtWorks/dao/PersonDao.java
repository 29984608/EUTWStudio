package com.thoughtWorks.dao;

import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.*;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.record.ObjRecord;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

public interface PersonDao {

    List<Map<String, String>> queryPersonList(Map<String, Object> data);

    Long queryPersonTotalCount();

    void addTeacher(Teacher teacher);

    void updateTeacher(Teacher teacher);

    void deleteTeacherById(String id);

    List<Map<String, String>> queryStudentsByLikes(Map<String, String> data);

    Map<String, String> queryTeacherByNo(String userName);

    void distributedClass(@Param("classesId") String classesId, @Param("ids") List<String> ids);

    List<Map<String, String>> queryStudentsByClassesIdsAndLikeName(Map<String, Object> data);

    long queryStudentsCount(@Param("searchDto") SearchDto searchDto);

    Student queryStudentByNo(String stuNo);

    void addCommunication(CommunicationContent content);

    List<Map<String, Object>> queryCommunicationByStudentId(String studentNo);

    void updateCommunicationContent(CommunicationContent communicationContent);

    void distributeDirection(@Param("directionId") String directionId, @Param("ids") List<String> ids);

    List<Map<String, Object>> queryAllDept(Map<String, Object> data);

    Long queryDeptTotalCount();

    void addDept(String name);

    void updateDept(Map<String, Object> data);

    void deleteDept(String id);

    Teacher queryUserById(String no);

    List<Direction> queryDirectionByDepartmentId(int departmentId);

    List<Direction> queryDirectionByDepartment();

    List<Classes> queryClass();

    List<Classes> queryClassByDepartmentId(int departmentId);

    List<Map<String, Object>> queryStudentInfoById(String studentNo) throws Exception;

    Long queryStudentsListCount(@Param("searchDto") SearchDto searchDto);

    List<Map<String, Object>> queryStudentList(Map<String, Object> data);

    List<Map<String, Object>> updateByStudentNo(String studentNo) throws Exception;

    List<Map<String, Object>> updateExperienceByStudentNo(String studentNo) throws Exception;

    List<Map<String, Object>> updateFamilyByStudentNo(String studentNo) throws Exception;

    Map<String, Object> queryStudentsToUpdate(String studentNo) throws Exception;

    List<Map<String, Object>> queryStudentFamily(String studentNo) throws Exception;

    List<Map<String, String>> queryStudentsProfessionList() throws Exception;

    List<Map<String, String>> queryStudentsDirection() throws Exception;

    List<Map<String, Object>> queryStudentsClassList() throws Exception;

    List<Map<String, Object>> queryStudentExperienceList() throws Exception;

    void insertCommunityTeacher(@Param("no") String no, @Param("areaId") int areaId, @Param("floorId") List<String> floorId) throws Exception;

    List<Map<String, Object>> queryTeacherCommunity(@Param("no") String no) throws Exception;

    void updateStudentTeacherId(@Param("teacherId") String teacherId, @Param("ids") List<String> ids)throws Exception;

    List<Map<String, Object>> teacherCommunity(String no)throws Exception;

    List<Map<String, Object>> teacherCommunity_floors(String no)throws Exception;

    List<Map<String, Object>> queryTeacherList() throws Exception;

    void updateExperienceList(@Param("experiences") List<Map<String, Object>> experiences, @Param("no") String no);

    void updateFamilyInfo(@Param("family")Map<String, Object> family, @Param("no") String no);
    void updateStudentList(StudentUpdate studentUpdate)throws Exception;

    void addTeacherToUser(@Param("teacher") Teacher teacher, @Param("roleId") int roleId);

    void deleteUserByTeacherId(String id);

    void addFamilyByUpdate(StudentFamily studentFamily);
}

