package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.StudentUpdate;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private PersonService personService;

    @RequestMapping()
    public String index() {
        return "infoManage/student/list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(PageUtil page, SearchDto searchDto) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, Object>> student = personService.queryStudentList(searchDto, page);
            data.put("student", student);
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("page", page);
            data.put("result", true);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
        }

        return data;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String, Object> update(String studentNo) {
        Map<String, Object> data = new HashMap<>();
        try {

            data.putAll(personService.updateByStudentNo(studentNo));
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("result", true);
        } catch (Exception e) {
            new RuntimeException(e);
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
        }
        return data;
    }

    @RequestMapping("/studentUpdate")
    @ResponseBody
    public Map<String, Object> studentUpdate(String studentNo) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> students = personService.queryStudentsToUpdate(studentNo);
            List<Map<String, Object>> students_family = personService.queryStudentFamily(studentNo);
            List<Map<String, String>> professionList = personService.queryStudentsProfessionList();
            List<Map<String, String>> directionList = personService.queryStudentsDirection();
            List<Map<String, Object>> classesList = personService.queryStudentsClassList();
            List<Map<String, Object>> experienceList = personService.queryStudentExperienceList();
            List<Map<String, Object>> teacherList = personService.queryTeacherList();
            data.put("students", students);
            data.put("students_family", students_family);
            data.put("professionList", professionList);
            data.put("directionList", directionList);
            data.put("classesList", classesList);
            data.put("experienceList", experienceList);
            data.put("teacherList", teacherList);
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("result", true);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("updateStudentAjax")
    @ResponseBody()
    public Result updateStudentAjax(StudentUpdate studentUpdate) {

        try {
            System.out.println(studentUpdate.getDirection_id());
            personService.updateStudentList(studentUpdate);
            return Result.success(null,Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null,Constant.UPDATE_FAILURE);
    }
}
