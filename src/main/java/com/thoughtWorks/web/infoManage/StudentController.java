package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Component
@RequestMapping("/student")
public class StudentController {

    @RequestMapping()
    @ResponseBody
    public String index() {
        return "infoManage/student/list";
    }
}
