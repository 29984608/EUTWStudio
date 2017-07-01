package com.thoughtWorks.service;

import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.CommunicationContent;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface PersonService {


    List<Map<String, String>> queryTeachersList(PageUtil page) throws Exception;

    void addTeacher(Teacher teacher, String classIds) throws Exception;

    void updateTeacher(Teacher teacher, String classIds) throws Exception;

    void deleteTeacherById(String id) throws Exception;

    Map<String, Object> queryStudentsByLikes(String userName, SearchDto searchDto) throws Exception;

    List<Classes> loadTeacherHasClassess(String no) throws Exception;

    void distributedClass(String classesId, String studentIds) throws Exception;

    List<Map<String, String>> queryStudentsByTeacherHasClasses(SearchDto searchDto, String no) throws Exception;

    Student queryStudentByNo(String stuNo) throws Exception;

    void addCommunication(CommunicationContent communicationContent) throws Exception;

    List<Map<String, Object>> queryCommunicationByStudentId(String studentNo) throws Exception;

    void updateCommunicationContent(CommunicationContent communicationContent)throws Exception;
}
