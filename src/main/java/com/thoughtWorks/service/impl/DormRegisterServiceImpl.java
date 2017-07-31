package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ReportDao;
import com.thoughtWorks.service.DormRegisterService;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.DateUtil;
import com.thoughtWorks.util.reportUtil.ProfessionReportUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Service
public class DormRegisterServiceImpl implements DormRegisterService {

    @Resource
    private ReportDao reportDao;


    @Override
    public File exportProfessionReport(HttpServletRequest request) throws Exception {
        return null;
    }

    public List<Map<String, Object>> queryDormPeopleNumber() throws Exception {
        List<Map<String, Object>> statisticStudents = null;
        List<Integer> searchLevels = DateUtil.getSearchLevels();

        List<Map<String, Object>> students = reportDao.queryDormPeopleNumber(searchLevels);
        if (students.size() != 0) statisticStudents = statisticStudentsCount(students);

        return statisticStudents;
    }

    private List<Map<String, Object>> statisticStudentsCount(List<Map<String, Object>> students) {
        String departmentName = null;
        Map<String, Object> temp = null;
        List<Map<String, Object>> statisticStudents = new ArrayList<>();

        for (Map<String, Object> student : students) {
            if (departmentName == null || !departmentName.equals(student.get("departmentName"))) {
                departmentName = (String) student.get("departmentName");
                temp = new LinkedHashMap<>();
                temp.put("departmentName", departmentName);
                temp.put("stay_type", new ArrayList<>());
                statisticStudents.add(temp);
            }
            setDepartmentProfessionStudentCount(temp, student);
        }

        return statisticStudents;
    }

    private void setDepartmentProfessionStudentCount(Map<String, Object> tempDepartment, Map<String, Object> student) {
        String stay_typeName = (String) student.get("stay_typeName");
        List<Map<String, Object>> stay_type = (List<Map<String, Object>>) tempDepartment.get("stay_type");

        if (stay_type.size() == 0)
            stay_type.add(createProfession(stay_typeName));

        boolean flag = false;
        for (Map<String, Object> profession : stay_type) {
            if (profession.get("stay_typeName").toString().equals(stay_typeName)) {
                flag = true;
                setLevelCount(profession, student);
            }
        }
        if (!flag) {
            stay_type.add(createProfession(stay_typeName));
            setLevelCount(stay_type.get(stay_type.size() - 1), student);
        }
    }

    private void setLevelCount(Map<String, Object> profession, Map<String, Object> student) {
        List<Integer> searchLevels = DateUtil.getSearchLevels();
        List<Map<String, Integer>> levels = (List<Map<String, Integer>>) profession.get("levels");
        if (levels.size() == 0) {
            for (int i = 0; i < searchLevels.size(); ++i) {
                Map<String, Integer> temp = new HashMap<>();
                temp.put("level", searchLevels.get(i));
                temp.put("count", 0);
                levels.add(temp);
            }
        }
        for (Map<String, Integer> level : levels) {
            if (level.get("level").intValue() == (int) student.get("level")) {
                int count = level.get("count");
                level.put("count", count + 1);
            }
        }
    }

    private Map<String, Object> createProfession(String stay_typeName) {
        Map<String, Object> tempProfession = new HashMap<>();
        tempProfession.put("stay_typeName", stay_typeName);
        tempProfession.put("levels", new ArrayList<>());

        return tempProfession;
    }


}
