package com.thoughtWorks.web.infoManage;


import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/student")
public class StudentController {
    @Resource
    private PersonService personService;

    @RequestMapping()
    public String index() {
        return "infoManage/student/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Result list(SearchDto searchDto) {
        try {
            searchDto.setName(new String(searchDto.getName().getBytes("ISO-8859-1"), "UTF-8"));
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            Map<String, Object> students = personService.queryStudentsByLikes(user.getUserName(), searchDto);

            return Result.success(students, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("student")
    @ResponseBody
    public Result student(String studentNo) {
        try {
            Student student = personService.queryStudentByNo(studentNo);

            return Result.success(student, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
    @RequestMapping("loadTeacherHasClassess")
    @ResponseBody
    public Result loadTeacherHasClassess() {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            List<Classes> classes = personService.loadTeacherHasClassess(user.getUserName());

            return Result.success(classes, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("distributedClass")
    @ResponseBody
    public Result distributedClass(String classesId,String studentIds) {
        try {
            personService.distributedClass(classesId, studentIds);

            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.ADD_FAILURE);
    }
}
