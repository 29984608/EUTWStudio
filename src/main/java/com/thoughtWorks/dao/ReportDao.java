package com.thoughtWorks.dao;

import java.util.List;
import java.util.Map;

public interface ReportDao {
    List<Map<String,String>> queryOldAndNewProfessionIds(String level);

    List<Map<String,String>> queryDepartments();

    List<Map<String,String>> queryProfessions();
}
