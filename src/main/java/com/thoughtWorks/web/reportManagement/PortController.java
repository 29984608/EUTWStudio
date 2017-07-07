package com.thoughtWorks.web.reportManagement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/port")
public class PortController {

    @RequestMapping("profession")
    public String professionIndex() {
        return "reportManagement/profession";
    }


    @RequestMapping("direction")
    public String directionIndex() {
        return "reportManagement/direction";
    }

    @RequestMapping("studentInfo")
    public String studentInfoIndex() {
        return "reportManagement/studentInfo";
    }
}
