package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.SearchDto;
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
        System.out.println(studentNo);
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, Object>> students = personService.queryStudentsToUpdate(studentNo);
            data.put("students", students);
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("result", true);
//            System.out.println("+++++++++++++++++++++++++"+data);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
            e.printStackTrace();
        }

        return data;
    }

}
