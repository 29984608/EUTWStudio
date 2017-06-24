package com.thoughtWorks.web.infoManage;


import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/student")
public class StudentController {

    @RequestMapping()
    public String index() {
        return "infoManage/student/list";
    }
}
