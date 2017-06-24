package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Permission;
import com.thoughtWorks.entity.Role;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface RoleDao {
     List<Role> queryList(Map<String, Integer> page);

    Integer queryTotalCount();

    void add(Role role);

    List<Permission> queryAllPermission();

    List<String> queryPermissionByRoleId(String roleId);
}
