package com.thoughtWorks.util;

import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.CommunicationContent;
import com.thoughtWorks.service.PersonService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UpdateStudentUtil {

    @Autowired
    PersonService personService;

    CommunicationContent communicationContent = new CommunicationContent();

    private String studentNo;
    private String studentName;

    public UpdateStudentUtil() {
    }

    public UpdateStudentUtil(String studentNo, String studentName) {
        this.studentNo = studentNo;
        this.studentName = studentName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public CommunicationContent updateStudentToCommunication() {
        ActiveUser user = null;
        try {
            setStudentName((String) personService.queryStudentsToUpdate(getStudentNo()).get("name"));
            user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            communicationContent.setTeacherId(user.getUserName());
            communicationContent.setStudentId(getStudentNo());
            communicationContent.setTalkName(getStudentName());
            communicationContent.setDirection("信息修改");
            String contents = "修改信息" + "$%$" +  communicationContent.getTeacherId() + "修改了" + getStudentName() + "的基本信息";
            communicationContent.setContent(contents);

            return communicationContent;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
