package com.thoughtWorks.dao;

import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface DormDao {


    Long queryAreasTotalCount();

    List<Map<String,Object>> queryAreas(Map<String, Object> data);

    void addArea(String name);

    void updateArea(Map<String, Object> data);

    void deleteArea(String id);
}
