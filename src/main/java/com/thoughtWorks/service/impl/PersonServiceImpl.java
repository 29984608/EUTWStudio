package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DepartmentDao;
import com.thoughtWorks.dao.PersonDao;
import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Direction;
import com.thoughtWorks.entity.Profession;
import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.service.DepartmentService;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        Map<String,String> teacher = personDao.queryTeacherByNo(userName);

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
        if(ids.size() != 0) personDao.distributedClass(classesId, ids);
    }
}