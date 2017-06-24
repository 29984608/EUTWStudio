package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.entity.Role;
import com.thoughtWorks.service.RoleService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userRole")
public class RoleController {
    @Resource
    private RoleService roleService;

    @RequestMapping()
    public String index() {
        return "systemManage/role/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> getList(PageUtil page) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Role> roles = roleService.queryList(page);
            data.put("roles", roles);
            data.put("page",page);
            data.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

}
