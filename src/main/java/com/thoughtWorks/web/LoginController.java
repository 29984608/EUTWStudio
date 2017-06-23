package com.thoughtWorks.web;


import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.service.PermissionService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "login")
    @ResponseBody
    private Result login(ActiveUser user) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            return Result.failure(null, Constant.ACCOUNT_NOT_EXIST);
        } catch (Exception e) {
            return Result.failure(null, Constant.ACCOUNT_OR_PWD_ERROR);
        }

        return Result.success();
    }

    @RequestMapping("getTopMenus")
    @ResponseBody
    public Result getTopMenus() {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            List<Map<String, String>> menus = permissionService.getTopMenus(user.getRoleId());

            return Result.success(menus, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("getSideMenus")
    @ResponseBody
    public Result getSideMenus(String pid) {
        try {
            List<Map<String, String>> sideMenus = permissionService.getSideMenus(pid);

            return Result.success(sideMenus, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();

            return Result.failure(null, Constant.SEARCH_FAILURE);
        }
    }

    @RequestMapping("logout")
    public String logout() {
        SecurityUtils.getSubject().logout();

        return "login";
    }
    @RequestMapping("index")
    public String index() {
        return "index";
    }

    @RequestMapping("toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("main")
    public String main() {
        return "main";
    }

}
