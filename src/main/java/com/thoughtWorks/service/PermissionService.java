package com.thoughtWorks.service;

import com.thoughtWorks.entity.User;

public interface PermissionService {
    User login(User user) throws Exception;
}
