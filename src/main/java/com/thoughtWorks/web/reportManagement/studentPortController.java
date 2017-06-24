package com.thoughtWorks.web.reportManagement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 2017/6/24.
 */
@Component
@RequestMapping("/studentPort")
public class studentPortController {

    @RequestMapping
    public String index() {
        return "/reportManagement/studentPort/list";
    }
}
