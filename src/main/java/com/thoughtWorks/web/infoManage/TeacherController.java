package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 2017/6/24.
 */
@Component
@RequestMapping("/teacher")
public class TeacherController {

    @RequestMapping()
    public String index() {
        return "infoManage/teacher/teacher";
    }
}
