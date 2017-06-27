package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DepartmentDao;
import com.thoughtWorks.entity.Direction;
import com.thoughtWorks.entity.Profession;
import com.thoughtWorks.service.DepartmentService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentDao departmentDao;

    @Override
    public List<Map<String, String>> queryDirectionList(PageUtil page) throws Exception{
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", (page.getCurrentIndex() - 1) * page.getPageSize() + page.getPageSize());
        page.setTotalSize(departmentDao.queryDirectTotalCount());

        return departmentDao.queryDirectionList(data);
    }

    @Override
    public void insertDirection(Direction direction) throws Exception {
        departmentDao.insertDirection(direction);
    }

    @Override
    public void updateDirection(Direction direction) throws Exception {
        departmentDao.updateDirection(direction);
    }

    @Override
    public void deleteDirection(String id) throws Exception {
        departmentDao.deleteDirection(id);
    }


    @Override
    public List<Map<String, String>> queryProfessionList(PageUtil page) throws Exception{
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("end", (page.getCurrentIndex() - 1) * page.getPageSize() + page.getPageSize());
        page.setTotalSize(departmentDao.queryProfessionTotalCount());

        return departmentDao.queryProfessionList(data);
    }

    @Override
    public void insertProfession(Profession profession) throws Exception {
        departmentDao.insertProfession(profession);
    }

    @Override
    public void updateProfession(Profession profession) throws Exception {
        departmentDao.updateProfession(profession);
    }

    @Override
    public void deleteProfession(String id) throws Exception {
        departmentDao.deleteProfession(id);
    }
}
