package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ReportDao;
import com.thoughtWorks.service.ReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Resource
    private ReportDao reportDao;


    @Override
    public List<Map<String, Object>> professionList(String level) throws Exception {
        String like = null == level || "".equals(level) ? "%%" : "%" + level + "%";
        List<Map<String, String>> ids = reportDao.queryOldAndNewProfessionIds(like);
        List<Map<String, String>> departmentList = reportDao.queryDepartments();
        List<Map<String, String>> professionList = reportDao.queryProfessions();

        countProfessionStudent(ids, professionList);

        List<Map<String, Object>> departmentChildProfession = bindDepartmentsAndProfessions(departmentList, professionList);

        return departmentChildProfession;
    }

    private List<Map<String, Object>> bindDepartmentsAndProfessions(List<Map<String, String>> departmentList, List<Map<String, String>> professionList) {
        List<Map<String, Object>> departmentChildProfession = new ArrayList<>();
        for (Map<String, String> department : departmentList) {
            Map<String, Object> temp = new HashMap<>();
            temp.put("name", department.get("name"));
            temp.put("children", new ArrayList<Map<String, String>>());

            for (Map<String, String> profession : professionList) {
                if (profession.get("department_id").equals(String.valueOf(department.get("id"))))
                    ((List<Map<String, String>>) temp.get("children")).add(profession);
            }

            departmentChildProfession.add(temp);
        }
        return departmentChildProfession;
    }

    private void countProfessionStudent(List<Map<String, String>> ids, List<Map<String, String>> professionList) {
        for (Map<String, String> id : ids) {
            for (Map<String, String> profession : professionList) {
                switch (getStudentState(profession, id)) {
                    case "NO_CHANGE":
                        addOne(profession, "oldNumber");
                        addOne(profession, "nowNumber");
                        break;
                    case "TURN_IN":
                        addOne(profession, "turnIn");
                        addOne(profession, "nowNumber");
                        break;
                    case "TURN_OUT":
                        addOne(profession, "turnOut");
                        addOne(profession, "oldNumber");
                        subOne(profession, "nowNumber");
                        break;
                }
            }
        }
    }

    private String getStudentState(Map<String, String> profession, Map<String, String> ids) {
        String professionId = String.valueOf(profession.get("id"));
        if (ids.get("oldId").equals(professionId) && !ids.get("nowId").equals(professionId))
            return "TURN_OUT";
        if (!ids.get("oldId").equals(professionId) && ids.get("nowId").equals(professionId))
            return "TURN_IN";
        if (ids.get("oldId").equals(professionId) && ids.get("nowId").equals(professionId))
            return "NO_CHANGE";

        return "";
    }

    private void addOne(Map<String, String> data, String param) {
        if (data.get(param) == null) {
            data.put(param, "1");
        } else {
            int oldNumber = Integer.parseInt(data.get(param)) + 1;
            data.put(param, String.valueOf(oldNumber));
        }
    }
    private void subOne(Map<String, String> data, String param) {
        if (data.get(param) == null) {
            data.put(param, "1");
        } else {
            int oldNumber = Integer.parseInt(data.get(param)) - 1;
            data.put(param, String.valueOf(oldNumber));
        }
    }
}
