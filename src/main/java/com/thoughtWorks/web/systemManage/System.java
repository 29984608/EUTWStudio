package com.thoughtWorks.web.systemManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rolePermission")
public class System {

    @RequestMapping("/")
    public String index() {
        return "systemManage/rolePermission";
    }
}
