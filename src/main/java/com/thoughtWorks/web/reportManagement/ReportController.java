package com.thoughtWorks.web.reportManagement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/report")
public class ReportController {

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
