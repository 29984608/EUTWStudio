package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.dao.PermissionDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Permission;
import com.thoughtWorks.service.PermissionService;
import com.thoughtWorks.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Resource
    private PermissionService permissionService;
    @Resource
    private PermissionDao permissionDao;

    @RequestMapping()
    public String index() {
        return "systemManage/menu/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Result list() {
        try {
            List<Permission> menus = permissionService.queryFirstMenus();

            return Result.success(menus, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success(null, Constant.SEARCH_FAILURE);
        }
    }

    @RequestMapping("addFirstMenu")
    @ResponseBody
    public Result addFirstMenu(Permission permission) {
        try {
            permissionService.addFirstMenu(permission);

            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success(null, Constant.ADD_FAILURE);
        }
    }

    @RequestMapping("updateFirstMenu")
    @ResponseBody
    public Result updateFirstMenu(Permission permission) {
        try {
            permissionDao.updateFirstMenu(permission);

            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success(null, Constant.UPDATE_FAILURE);
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public Result delete(String id) {
        try {
            permissionService.delete(id);

            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success(null, Constant.DELETE_FAILURE);
        }
    }


}
