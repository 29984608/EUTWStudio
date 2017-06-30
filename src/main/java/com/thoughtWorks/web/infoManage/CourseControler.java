package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/course")
public class CourseControler {
    @RequestMapping()
    public String index(){
        return "infoManage/course/course";
    }
}
