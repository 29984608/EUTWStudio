package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


@Component
@RequestMapping("/profession")
public class ProfessionControler {
    @RequestMapping()
    public String index(){
        return "infoManage/profession/profession";
    }

}
