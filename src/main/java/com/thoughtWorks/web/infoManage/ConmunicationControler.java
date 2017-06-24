package com.thoughtWorks.web.infoManage;


import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/communication")
public class ConmunicationControler {

    @RequestMapping()
    public String index() {
        return "infoManage/communication/list";
    }

}
