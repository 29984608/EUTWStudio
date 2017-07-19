package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DepartmentDao;
import com.thoughtWorks.dao.PersonDao;
import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.*;
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
        List<String> ids;
        if (teacher.getClassify().equals("1")) {
            teacher.setClassify("职业导师");
            ids = Arrays.asList(classIds.split(","));
            teacher.setDeptId(0);
            if (ids.size() != 0) trainModuleDao.updateClassTeacher(teacher.getNo(), ids);
        } else if (teacher.getClassify().equals("2")) {
            teacher.setClassify("系辅导员、行政");
            teacher.setDepartmentId("0");
            teacher.setDirectionId("0");
        }
        personDao.addTeacher(teacher);

    }

    @Override
    public void updateTeacher(Teacher teacher, String classIds) throws Exception {
        List<String> ids;
        if (teacher.getClassify().equals("职业导师")) {
            ids = Arrays.asList(classIds.split(","));
            trainModuleDao.deleteTeacherAllClassesId(teacher.getNo());
            if (ids.size() != 0) trainModuleDao.updateClassTeacher(teacher.getNo(), ids);
        } else {
            teacher.setDepartmentId("0");
            teacher.setDirectionId("0");
        }
        personDao.updateTeacher(teacher);
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
        data.put("classesId", searchDto.getClassesId());
        data.put("studentNo", searchDto.getStudentNo() + "%");
        data.put("name", "%" + searchDto.getName() + "%");
        List<Map<String, String>> students = personDao.queryStudentsByLikes(data);

        Map<String, String> teacher = personDao.queryTeacherByNo(userName);

        List<Direction> directions = departmentDao.queryDirectionsByDepartmentId(String.valueOf(teacher.get("department_id")));
        List<Profession> professions = departmentDao.queryProfessionsByDepartmentId(String.valueOf(teacher.get("department_id")));
        List<Classes> classes = trainModuleDao.queryClassesByTeacherHas(userName);

        result.put("studentClass", students);
        result.put("professions", professions);
        result.put("directions", directions);
        result.put("classess", classes);

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
    public void distributedDirection(String directionId, String studentIds) throws Exception {
        List<String> ids = Arrays.asList(studentIds.split(","));
        if (ids.size() != 0) personDao.distributeDirection(directionId, ids);
    }

    @Override
    public List<Map<String, Object>> queryAllDept(PageUtil pageUtil) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getPageSize());
        pageUtil.setTotalSize(personDao.queryDeptTotalCount());
        return personDao.queryAllDept(data);
    }

    @Override
    public void addDept(String name) throws Exception {
        personDao.addDept(name);
    }

    @Override
    public void updateDept(String name, String id) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        data.put("name", name);
        personDao.updateDept(data);
    }

    @Override
    public void deleteDept(String id) throws Exception {
        personDao.deleteDept(id);
    }

    @Override
    public List<Map<String, String>> queryStudentsByTeacherHasClasses(SearchDto searchDto, PageUtil page) throws Exception {
        Map<String, Object> data = new HashMap<>();
        searchDto.setStudentNo("%" + searchDto.getStudentNo() + "%");
        searchDto.setName("%" + searchDto.getName() + "%");
        searchDto.setRoomId("%" + searchDto.getRoomId() + "%");
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("pageSize", page.getPageSize());
        data.put("searchDto", searchDto);
        page.setTotalSize(personDao.queryStudentsCount(searchDto));
        return personDao.queryStudentsByClassesIdsAndLikeName(data);
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
            communication.put("time", time.substring(0, time.length() - 2));
        }

        return communications;
    }

    @Override
    public void updateCommunicationContent(CommunicationContent communicationContent) throws Exception {
        personDao.updateCommunicationContent(communicationContent);
    }

    @Override
    public Teacher queryUserById(String no) throws Exception {
        return personDao.queryUserById(no);
    }

    @Override
    public List<Direction> queryDirectionByDepartmentId(int departmentId) throws Exception {

        return personDao.queryDirectionByDepartmentId(departmentId);
    }

    @Override
    public List<Direction> queryDirectionByDepartment() throws Exception {

        return personDao.queryDirectionByDepartment();
    }

    @Override
    public List<Classes> queryClass() throws Exception {

        return personDao.queryClass();
    }

    @Override
    public List<Classes> queryClassByDepartmentId(int departmentId) throws Exception {

        return personDao.queryClassByDepartmentId(departmentId);
    }

    @Override
    public List<Map<String, Object>> queryStudentInfoById(String studentNo) throws Exception {

        return personDao.queryStudentInfoById(studentNo);
    }

    @Override
    public List<Map<String, Object>> queryStudentList(SearchDto searchDto, PageUtil page) throws Exception {
        Map<String, Object> data = new HashMap<>();
        searchDto.setStudentNo("%" + searchDto.getStudentNo() + "%");
        searchDto.setName("%" + searchDto.getName() + "%");
        searchDto.setRoomId("%" + searchDto.getRoomId() + "%");
        if (searchDto.getSex() == null) {
            searchDto.setSex("%" + "%");
        } else {
            searchDto.setSex("%" + searchDto.getSex() + "%");
        }

        if (searchDto.getTypeOfAccommodation()==null){
            searchDto.setTypeOfAccommodation("");
        }else {
            searchDto.setTypeOfAccommodation(searchDto.getTypeOfAccommodation());
        }
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("pageSize", page.getPageSize());
        data.put("searchDto", searchDto);

        System.out.println(personDao.queryStudentList(data));

        page.setTotalSize(personDao.queryStudentsListCount(searchDto));

        return personDao.queryStudentList(data);

    }

}