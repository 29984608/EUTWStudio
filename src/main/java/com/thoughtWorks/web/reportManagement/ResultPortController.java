package com.thoughtWorks.web.reportManagement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 2017/6/24.
 */
@Component
@RequestMapping("/resultPort")
public class ResultPortController {
    @RequestMapping
    public String index() {
        return "/reportManagement/resultPort/resultPort";
    }
}
