package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.RoleDao;
import com.thoughtWorks.entity.Role;
import com.thoughtWorks.service.RoleService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    @Override
    public List<Role> queryList(PageUtil page)throws Exception {
        Map<String, Integer> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex()-1) * page.getPageSize());
        data.put("end", page.getCurrentIndex() * page.getPageSize() + page.getPageSize());
        page.setTotalSize(roleDao.queryTotalCount() / page.getPageSize());
        return roleDao.queryList(data);
    }

    @Override
    public void add(Role role)throws Exception {
        roleDao.add(role);
    }
}
