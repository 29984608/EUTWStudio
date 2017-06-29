package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.PersonDao;
import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PersonServiceImpl implements PersonService{
    @Resource
    private PersonDao personDao;
    @Resource
    private TrainModuleDao trainModuleDao;

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
        if(ids.size() != 0)trainModuleDao.updateClassTeacher(teacher.getNo(),ids);
    }

    @Override
    public void updateTeacher(Teacher teacher, String classIds) throws Exception {
        List<String> ids = Arrays.asList(classIds.split(","));
        personDao.updateTeacher(teacher);
        trainModuleDao.deleteTeacherAllClassesId(teacher.getNo());
        if(ids.size() != 0)trainModuleDao.updateClassTeacher(teacher.getNo(),ids);
    }

    @Override
    public void deleteTeacherById(String id) throws Exception {
        personDao.deleteTeacherById(id);
        trainModuleDao.deleteTeacherAllClassesId(id);
    }
}