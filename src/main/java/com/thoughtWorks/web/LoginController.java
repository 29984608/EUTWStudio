package com.thoughtWorks.web;


import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "login")
    @ResponseBody
    private Result login(User user) {
        try {
            return Result.success(permissionService.login(user));
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failure("error");
        }
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
