package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Role;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface RoleDao {
     List<Role> queryList(Map<String, Integer> page);

    Integer queryTotalCount();
}
