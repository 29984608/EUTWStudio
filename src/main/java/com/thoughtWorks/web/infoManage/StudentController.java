package com.thoughtWorks.web.infoManage;


import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
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
    public Result list(String professionId, String directionId, String name) {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            List<Map<String,String>> students = personService.queryStudentsByLikes(user.getUserName(), professionId, directionId, name);

            return Result.success(students, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
