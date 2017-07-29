package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ReportDao;
import com.thoughtWorks.service.ReportService;
import com.thoughtWorks.util.DateUtil;
import com.thoughtWorks.util.excelUtil.ExcelReportUtil;
import com.thoughtWorks.util.reportUtil.NewStudentRegisterReportUtil;
import com.thoughtWorks.util.reportUtil.ProfessionReportUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Resource
    private ReportDao reportDao;


    @Override
    public File exportProfessionReport(String level, HttpServletRequest request) throws Exception {
        Map<String, String> headers = new HashMap<>();
        headers.put("index", "序号");
        headers.put("departmentName", "系名");
        headers.put("name", "原录取专业");
        headers.put("oldNumber", "人数");
        headers.put("turnIn", "转入");
        headers.put("turnOut", "转出");
        headers.put("name1", "现专业");
        headers.put("nowNumber", "人数");
        headers.put("remark", "备注");

        List<Map<String, Object>> dataSet = professionList(level);
        String fileName = "高职学院专业人数统计表" + (level == null ? "" : level) + ".xls";
        String path = request.getServletContext().getRealPath("images/temp") + "/" + fileName;
        File file = new File(path);
        new ProfessionReportUtil().exportExcel(headers, dataSet, file, fileName.substring(0, fileName.lastIndexOf(".")));

        return file;
    }



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



    public List<Map<String, Object>> queryDormPeopleNumber1() {
        List<Map<String, Object>> dormPeoples =reportDao.queryDormPeopleNumber(DateUtil.getSearchLevels());


        return dormPeoples;
    }


    public List<Map<String, Object>> queryDormPeopleNumber() {
        List<Map<String, Object>> statisticCount = new ArrayList<>();
        List<Map<String, Object>> dormPeoples =reportDao.queryDormPeopleNumber(DateUtil.getSearchLevels());
        if (dormPeoples.size() == 0) return statisticCount;

        for (Map<String, Object> dormPeople : dormPeoples) {
            if (!hasDepartment(dormPeople, statisticCount)) {
                statisticCount.add(createDepartment(dormPeople));
                if (null == dormPeople.get("department")) continue;
            }
            statisticTypeCount(statisticCount, dormPeople);
        }

        return statisticCount;
    }



    private void statisticTypeCount(List<Map<String, Object>> statisticCount, Map<String, Object> communication) {
        for (Map<String, Object> tempCommunication : statisticCount) {
            if (tempCommunication.get("department").equals(communication.get("department")))
                if (!hasCommunicationType(tempCommunication.get("stay_type"), communication))
                    createDepartmentCommunicationType(tempCommunication, communication);

            addDepartmentCommunicationTypeCount(tempCommunication.get("stay_type"), communication);
        }
    }

    private void createDepartmentCommunicationType(Map<String, Object> tempCommunication, Map<String, Object> communication) {
        List<Integer> levels = DateUtil.getSearchLevels();
        List<Map<String, Object>> types = (List<Map<String, Object>>) tempCommunication.get("stay_type");
        if (types == null || types.size() == 0) {
            types = new ArrayList<>();
            Map<String, Object> type = createType(communication, levels);
            types.add(type);
        } else {
            boolean flag = true;
            for (Map<String, Object> tempType : types) {
                if (tempType.get("stay_type").equals(communication.get("stay_type"))) flag = false;
            }
            if (flag) {
                Map<String, Object> type = createType(communication, levels);
                types.add(type);
            }
        }

        tempCommunication.put("stay_type", types);
    }

    private Map<String, Object> createType(Map<String, Object> communication, List<Integer> levels) {
        Map<String, Object> type = new HashMap<>();
        type.put("stay_type", communication.get("stay_type"));
        List<Map<String, Integer>> level = new ArrayList<>();
        for (int i = 0; i < 3; ++i) {
            Map<String, Integer> temp = new HashMap<>();
            temp.put("level", levels.get(i));
            temp.put("count", 0);
            level.add(temp);
        }
        type.put("levels", level);

        return type;
    }

    private void addDepartmentCommunicationTypeCount(Object communicationType, Map<String, Object> communication) {
        List<Map<String, Object>> types = (List<Map<String, Object>>) communicationType;

        for (Map<String, Object> type : types) {
            if (type.get("stay_type").equals(communication.get("stay_type")))
                addTypeLevelCount(type, (int) communication.get("level"));
        }
    }

    private void addTypeLevelCount(Map<String, Object> type, int level) {
        List<Map<String, Integer>> levels = (List<Map<String, Integer>>) type.get("levels");
        for (Map<String, Integer> tempLevel : levels) {
            if (tempLevel.get("level").toString().equals(String.valueOf(level))) {
                int count = tempLevel.get("count");
                tempLevel.put("count", ++count);
            }
        }
    }

    private boolean hasCommunicationType(Object communicationType, Map<String, Object> communication) {
        List<Map<String, Object>> types = (List<Map<String, Object>>) communicationType;

        if (types == null || types.size() == 0) return false;

        for (Map<String, Object> type : types) {
            if (type.get("stay_type").equals(communication.get("stay_type"))) return true;
        }

        return false;
    }

    private Map<String, Object> createDepartment(Map<String, Object> communication) {
        Map<String, Object> department = new HashMap<>();
        department.put("department", communication.get("department"));
        department.put("stay_type", new ArrayList<Map<String, Object>>());

        return department;
    }

    private boolean hasDepartment(Map<String, Object> communication, List<Map<String, Object>> statisticCount) {
        for (Map<String, Object> statistic : statisticCount) {
            if (communication.get("department").toString().equals(statistic.get("department") + ""))
                return true;
        }

        return false;
    }

}
