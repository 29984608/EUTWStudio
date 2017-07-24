package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.service.ReportService;
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
public class DormRegister {
    @Autowired
    private ReportService reportService;

    @RequestMapping()
    public String index(){
        return "reportManagement/dormRegister";
    }

    @RequestMapping("/dormList")
    @ResponseBody
    public Map<String,Object> DormList() throws Exception {
        Map<String,Object> data =new HashMap<>();
        List<Integer> list = new ArrayList<>();
        list.add(2015);
        list.add(2016);
        list.add(2017);
        List a =reportService.queryDormPeopleNumber(list);
        data.put("data",a);
        return data;
    }
}
