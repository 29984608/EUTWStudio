package com.thoughtWorks.dao;

import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Permission;
import com.thoughtWorks.entity.User;

import java.util.List;
import java.util.Map;

public interface PermissionDao {

    User login(User user);

    ActiveUser getSysUserByUserName(String userName);

    List<Permission> findMenuListByRoleId(int roleId);

    List<Permission> findPermissionListByRoleId(int roleId);

    List<Map<String,String>> getTopMenus();

    List<Map<String, String>> getSideMenus(String parentId);
}
