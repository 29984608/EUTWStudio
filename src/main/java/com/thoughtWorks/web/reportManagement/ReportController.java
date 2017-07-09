package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.Constant;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/report")
public class ReportController {
    @Resource
    private ReportService reportService;

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


    @RequestMapping("professionList")
    @ResponseBody
    public Result professionList(String level) {
        try {
            List<Map<String, Object>> data = reportService.professionList(level);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
