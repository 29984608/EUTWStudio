package com.thoughtWorks.service;

import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.*;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface PersonService {


    List<Map<String, String>> queryTeachersList(PageUtil page) throws Exception;

    void addTeacher(Teacher teacher, String classIds,String floorIds,int areaId) throws Exception;

    void updateTeacher(Teacher teacher, String classIds) throws Exception;

    void deleteTeacherById(String id) throws Exception;

    Map<String, Object> queryStudentsByLikes(String userName, SearchDto searchDto) throws Exception;

    List<Classes> loadTeacherHasClassess(String no) throws Exception;

    void distributedClass(String classesId, String studentIds) throws Exception;

    List<Map<String, String>> queryStudentsByTeacherHasClasses(SearchDto searchDto, PageUtil page) throws Exception;

    Student queryStudentByNo(String stuNo) throws Exception;

    void addCommunication(CommunicationContent communicationContent) throws Exception;

    List<Map<String, Object>> queryCommunicationByStudentId(String studentNo) throws Exception;

    void updateCommunicationContent(CommunicationContent communicationContent)throws Exception;

    void distributedDirection(String directionId, String studentIds)throws Exception;

    List<Map<String,Object>> queryAllDept(PageUtil pageUtil)throws Exception ;

    void addDept(String name)throws Exception ;

    void updateDept(String name, String id)throws Exception ;

    void deleteDept(String id)throws Exception ;

    Teacher queryUserById(String no)throws Exception ;

    List<Direction>queryDirectionByDepartmentId(int departmentId)throws Exception ;

    List<Direction> queryDirectionByDepartment()throws Exception ;

    List<Classes> queryClass()throws Exception ;

    List<Classes> queryClassByDepartmentId(int departmentId)throws Exception ;

    List<Map<String ,Object>> queryStudentInfoById(String studentNo )throws Exception ;

    List<Map<String,Object>> queryStudentList(SearchDto searchDto, PageUtil page)throws Exception;

    Map<String, Object> updateByStudentNo(String studentNo) throws Exception;

    Map<String,Object> queryStudentsToUpdate(String studentNo)throws Exception;

    List<Map<String, Object>> queryStudentFamily(String studentNo) throws Exception;

    List<Map<String,String>> queryStudentsProfessionList() throws Exception;

    List<Map<String, String>> queryStudentsDirection() throws Exception;

    List<Map<String, Object>> queryStudentsClassList() throws Exception;

    List<Map<String, Object>> queryStudentExperienceList() throws Exception;

    List <Map<String,Object>> queryTeacherCommunity(String no)throws Exception;

    void updateStudentTeacherId(String teacherId, String studentIds)throws Exception;
}
