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
    public Result listArea(PageUtil pageUtil) {
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
    public Result addArea(String name) {
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
    public Result updateArea(String name,String id) {
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
    public Result deleteArea(String id) {
        try {
            dormService.deleteArea(id);

            return Result.success("null",Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.DELETE_FAILURE);
    }

    @RequestMapping("/floor/list")
    @ResponseBody
    public Result listFloor(PageUtil pageUtil) {
        try {
            Map<String, Object> data = new HashMap<>();
            List<Map<String,Object>> pageInfos = dormService.queryFloors(pageUtil);
            data.put("pageInfos", pageInfos);
            data.put("pageUtil", pageUtil);

            System.out.println(data);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/floor/add")
    @ResponseBody
    public Result addFloor(String name,String areaId) {
        try {
            dormService.addFloor(name,areaId);

            return Result.success("null", Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.ADD_FAILURE);
    }

    @RequestMapping("/floor/update")
    @ResponseBody
    public Result updateFloor(String name,String id) {
        try {
            dormService.updateFloor(name,id);

            return Result.success("null", Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/floor/delete")
    @ResponseBody
    public Result deleteFloor(String id) {
        try {
            dormService.deleteFloor(id);

            return Result.success("null",Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.DELETE_FAILURE);
    }

    @RequestMapping("/floor/selectArea")
    @ResponseBody
    public Result selectAreaOfFloor() {
        try {
            Map<String, Object> data = new HashMap<>();
            List<Map<String,Object>> dormInfos = dormService.selectAreaOfFloor();
            data.put("dormInfos", dormInfos);
            System.out.println(data);
            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("null",Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/room/list")
    @ResponseBody
    public Result listRoom(PageUtil pageUtil) {
        try {
            Map<String, Object> data = new HashMap<>();
            List<Map<String,Object>> pageInfos = dormService.queryRooms(pageUtil);
            data.put("pageInfos", pageInfos);
            data.put("pageUtil", pageUtil);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/room/add")
    @ResponseBody
    public Result addRoom(String name) {
        try {
            dormService.addRoom(name);

            return Result.success("null", Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.ADD_FAILURE);
    }

    @RequestMapping("/room/update")
    @ResponseBody
    public Result updateRoom(String name,String id) {
        try {
            dormService.updateRoom(name,id);

            return Result.success("null", Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/room/delete")
    @ResponseBody
    public Result deleteRoom(String id) {
        try {
            dormService.deleteRoom(id);

            return Result.success("null",Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure("null",Constant.DELETE_FAILURE);
    }
}
