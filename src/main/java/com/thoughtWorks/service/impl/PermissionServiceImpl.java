package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.PermissionDao;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Permission;
import com.thoughtWorks.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;


    @Override
    public ActiveUser getSysUserByUserName(String roleId) throws Exception {
        return permissionDao.getSysUserByUserName(roleId);
    }

    @Override
    public List<Permission> findMenuListByRoleId(int roleId) throws Exception {
        return permissionDao.findMenuListByRoleId(roleId);
    }

    @Override
    public List<Permission> findPermissionListByRoleId(int roleId) throws Exception {
        return permissionDao.findPermissionListByRoleId(roleId);
    }

    @Override
    public List<Map<String, String>> getTopMenus(int roleId) throws Exception {
        return permissionDao.getTopMenus(roleId);
    }

    @Override
    public List<Map<String, String>> getSideMenus(String parentId, String roleId) throws Exception {
        List<Map<String, String>> sideMenus = permissionDao.getSideMenus(parentId, roleId);
        return sideMenus;
    }
}
