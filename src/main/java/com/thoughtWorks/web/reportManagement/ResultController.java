package com.thoughtWorks.web.reportManagement;

import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ResultService;
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
@RequestMapping("/result")
public class ResultController {

    @Resource
    private ResultService resultService;

    @RequestMapping("rank")
    public String rankIndex() {
        return "reportManagement/result/rankList";
    }
    @RequestMapping("search")
    public String searchIndex() {
        return "reportManagement/result/searchList";
    }

    @RequestMapping("searchList")
    @ResponseBody
    public Map<String,Object> searchList(SearchDto searchDto, PageUtil pageUtil) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, String>> results = resultService.querySearchList(searchDto,pageUtil);
            data.put("results", results);
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

    @RequestMapping("rankList")
    @ResponseBody
    public Map<String,Object> rankList(SearchDto searchDto, PageUtil pageUtil) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, String>> results = resultService.queryRankList(searchDto,pageUtil);
            data.put("results", results);
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
}
