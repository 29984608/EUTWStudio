package com.thoughtWorks.service;

import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Permission;
import com.thoughtWorks.entity.User;

import java.util.List;
import java.util.Map;

public interface PermissionService {
    User login(User user) throws Exception;

    ActiveUser getSysUserByUserName(String userName) ;

    List<Permission> findMenuListByRoleId(int roleId) ;

    List<Permission> findPermissionListByRoleId(int roleId);

    List<Map<String,String>> getTopMenus(int roleId)throws Exception;

    List<Map<String, String>> getSideMenus(String parentId,String roleId) throws Exception;
}
