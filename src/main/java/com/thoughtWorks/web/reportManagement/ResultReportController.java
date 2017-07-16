package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.service.ResultReportService;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/resultReport")
public class ResultReportController {

    @Resource
    private ResultReportService resultReportService;

    @RequestMapping("")
    public String index() {
        return "reportManagement/result/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String,Object> list(SearchDto searchDto, PageUtil pageUtil) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, String>> students = resultReportService.showResultReportList(searchDto,pageUtil);
            data.put("students", students);
            data.put("page", pageUtil);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            data.put("result", false);
            data.put("msg", Constant.SEARCH_FAILURE);
        }

        return data;
    }

    @RequestMapping("preview")
    @ResponseBody
    public Map<String, Object> preview(String no) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String,String> student = resultReportService.queryStudentByNo(no);
            Map<String,String> results = resultReportService.queryStudentCourseResultByNo(no);
            data.put("student", student);
            data.put("results", results);
            data.put("result", true);
            data.put("msg", Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            data.put("result", false);
            data.put("msg", Constant.SEARCH_SUCCESS);
        }

        return data;
    }
}
