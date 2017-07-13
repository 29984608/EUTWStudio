package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.DormService;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/dorm")
public class DormController {

    @Autowired
    private DormService dormService;

    @RequestMapping("/area")
    public String areaIndex() {
        return "infoManage/dorm/area/area";
    }

    @RequestMapping("/floor")
    public String floorIndex() {
        return "infoManage/dorm/floor/floor";
    }


    @RequestMapping("/room")
    public String roomIndex() {
        return "infoManage/dorm/room/room";
    }

    @RequestMapping("/area/list")
    @ResponseBody
    public Result list(PageUtil pageUtil) {
        try {
            Map<String, Object> data = new HashMap<>();
            List<Map<String,Object>> pageInfos = dormService.queryAreas(pageUtil);
            data.put("pageInfos", pageInfos);
            data.put("pageUtil", pageUtil);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/area/add")
    @ResponseBody
    public Result add(String name) {
        try {
            dormService.addArea(name);

            return Result.success("null", Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.ADD_FAILURE);
    }

    @RequestMapping("/area/update")
    @ResponseBody
    public Result update(String name,String id) {
        try {
            dormService.updateArea(name,id);

            return Result.success("null", Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/area/delete")
    @ResponseBody
    public Result delete(String id) {
        try {
            dormService.deleteArea(id);

            return Result.success("null",Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.DELETE_FAILURE);
    }
}
