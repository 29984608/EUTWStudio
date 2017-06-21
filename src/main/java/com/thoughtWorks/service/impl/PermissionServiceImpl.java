package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.PermissionDao;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermissionServiceImpl implements PermissionService{
    @Autowired
    private PermissionDao permissionDao;

    @Override
    public User login(User user) throws Exception {
        return permissionDao.login(user);
    }
}
