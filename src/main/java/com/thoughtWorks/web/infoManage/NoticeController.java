package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dao.TrainModuleDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.service.TrainModuleService;
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
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    private TrainModuleDao trainModuleDao;

    @RequestMapping()
    public String index() {
        return "infoManage/notice/list";
    }

    @RequestMapping("add")
    @ResponseBody
    public Result addManual(SearchDto searchDto) {
        try {
            trainModuleDao.addClassesManual(searchDto);

            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.ADD_FAILURE);
    }

}
