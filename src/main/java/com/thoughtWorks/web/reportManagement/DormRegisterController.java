package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
@RequestMapping("/dormRegister")
public class DormRegisterController {
    @Autowired
    private ReportService reportService;

    @RequestMapping()
    public String index(){
        return "reportManagement/dormRegister";
    }

    @RequestMapping("/dormList")
    @ResponseBody
    public Result DormList() throws Exception {
        try {
            List<Map<String, Object>> data =reportService.queryDormPeopleNumber();

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

}
