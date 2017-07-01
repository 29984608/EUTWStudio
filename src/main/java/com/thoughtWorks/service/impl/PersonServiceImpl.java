package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DepartmentDao;
import com.thoughtWorks.dao.PersonDao;
import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.*;
import com.thoughtWorks.service.DepartmentService;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class PersonServiceImpl implements PersonService {
    @Resource
    private PersonDao personDao;
    @Resource
    private TrainModuleDao trainModuleDao;
    @Resource
    private DepartmentDao departmentDao;

    @Override
    public List<Map<String, String>> queryTeachersList(PageUtil page) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", page.getPageSize());
        page.setTotalSize(personDao.queryPersonTotalCount());

        return personDao.queryPersonList(data);
    }

    @Override
    public void addTeacher(Teacher teacher, String classIds) throws Exception {
        List<String> ids = Arrays.asList(classIds.split(","));
        personDao.addTeacher(teacher);
        if (ids.size() != 0) trainModuleDao.updateClassTeacher(teacher.getNo(), ids);
    }

    @Override
    public void updateTeacher(Teacher teacher, String classIds) throws Exception {
        List<String> ids = Arrays.asList(classIds.split(","));
        personDao.updateTeacher(teacher);
        trainModuleDao.deleteTeacherAllClassesId(teacher.getNo());
        if (ids.size() != 0) trainModuleDao.updateClassTeacher(teacher.getNo(), ids);
    }

    @Override
    public void deleteTeacherById(String id) throws Exception {
        personDao.deleteTeacherById(id);
        trainModuleDao.deleteTeacherAllClassesId(id);
    }

    @Override
    public Map<String, Object> queryStudentsByLikes(String userName, SearchDto searchDto) throws Exception {
        Map<String, Object> result = new HashMap<>();
        Map<String, String> data = new HashMap<>();
        data.put("no", userName);
        data.put("professionId", searchDto.getProfessionId());
        data.put("directionId", searchDto.getDirectionId());
        data.put("name", "%" + searchDto.getName() + "%");
        List<Map<String, String>> students = personDao.queryStudentsByLikes(data);

        Map<String, String> teacher = personDao.queryTeacherByNo(userName);

        List<Direction> directions = departmentDao.queryDirectionsByDepartmentId(String.valueOf(teacher.get("department_id")));
        List<Profession> professions = departmentDao.queryProfessionsByDepartmentId(String.valueOf(teacher.get("department_id")));

        result.put("students", students);
        result.put("professions", professions);
        result.put("directions", directions);

        return result;
    }

    @Override
    public List<Classes> loadTeacherHasClassess(String no) throws Exception {
        return trainModuleDao.loadTeacherHasClassess(no);
    }

    @Override
    public void distributedClass(String classesId, String studentIds) throws Exception {
        List<String> ids = Arrays.asList(studentIds.split(","));
        if (ids.size() != 0) personDao.distributedClass(classesId, ids);
    }

    @Override
    public List<Map<String, String>> queryStudentsByTeacherHasClasses(SearchDto searchDto, String no) throws Exception {
        List<Classes> classes = trainModuleDao.queryClassesByTeacherHas(no);

        return personDao.queryStudentsByClassesIdsAndLikeName("%" + searchDto.getName() + "%", classes);
    }

    @Override
    public Student queryStudentByNo(String stuNo) throws Exception {
        return personDao.queryStudentByNo(stuNo);
    }

    @Override
    public void addCommunication(CommunicationContent communicationContent) throws Exception {
        communicationContent.setTime(new Date());

        personDao.addCommunication(communicationContent);
    }

    @Override
    public List<Map<String, Object>> queryCommunicationByStudentId(String studentNo) throws Exception {
        List<Map<String, Object>> communications = personDao.queryCommunicationByStudentId(studentNo);
        for (Map<String, Object> communication : communications) {
            String content = communication.get("content") + "";
            communication.put("contents", content.split(Constant.SPLIT_TAG));
            String time = ((Date) communication.get("time")).toString();
            communication.put("time", time.substring(0,time.length()-2));
        }

        return communications;
    }

    @Override
    public void updateCommunicationContent(CommunicationContent communicationContent) throws Exception {
        personDao.updateCommunicationContent(communicationContent);
    }
}