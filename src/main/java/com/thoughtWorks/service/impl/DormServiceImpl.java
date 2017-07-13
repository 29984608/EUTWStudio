package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DormDao;
import com.thoughtWorks.service.DormService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service

public class DormServiceImpl implements DormService {

    @Autowired
    private DormDao dormDao;

    @Override
    public List<Map<String, Object>> queryAreas(PageUtil pageUtil)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getCurrentIndex() * pageUtil.getPageSize());
        pageUtil.setTotalSize(dormDao.queryAreasTotalCount());
        return dormDao.queryAreas(data);
    }

    @Override
    public void addArea(String name)throws Exception {
        dormDao.addArea(name);
    }

    @Override
    public void updateArea(String name, String id)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("name", name);
        data.put("id", id);
        dormDao.updateArea(data);
    }

    @Override
    public void deleteArea(String id)throws Exception {
        dormDao.deleteArea(id);
    }
}
