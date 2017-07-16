package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.service.ResultReportService;
import com.thoughtWorks.util.Constant;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    public Result list(SearchDto searchDto) {
        try {
            List<Map<String, String>> students = resultReportService.showResultReportList(searchDto);

            return Result.success(students, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
