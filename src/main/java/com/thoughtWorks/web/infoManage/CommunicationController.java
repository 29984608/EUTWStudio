package com.thoughtWorks.web.infoManage;


import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.CommunicationContent;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/communication")
public class CommunicationController {

    @Resource
    private PersonService personService;

    @RequestMapping()
    public String index() {
        return "infoManage/communication/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Result list(SearchDto searchDto) {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            List<Map<String, String>> students = personService.queryStudentsByTeacherHasClasses(searchDto, user.getUserName());

            return Result.success(students, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("add")
    @ResponseBody
    public Result add(CommunicationContent communicationContent) {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            communicationContent.setTeacherId(user.getUserName());
            personService.addCommunication(communicationContent);

            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("communication")
    @ResponseBody
    public Result communication(String studentNo) {
        try {
            List<Map<String, Object>> communication = personService.queryCommunicationByStudentId(studentNo);

            return Result.success(communication, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("updateContent")
    @ResponseBody
    public Result updateContent(CommunicationContent communicationContent) {
        try {
            personService.updateCommunicationContent(communicationContent);

            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

}
