package com.thoughtWorks.service;

import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface DormService {

    List<Map<String,Object>> queryAreas(PageUtil pageUtil)throws Exception;

    void addArea(String name)throws Exception;

    void updateArea(String name, String id)throws Exception;

    void deleteArea(String id)throws Exception;
}
