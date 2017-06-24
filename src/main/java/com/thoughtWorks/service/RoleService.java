package com.thoughtWorks.service;

import com.thoughtWorks.entity.Role;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface RoleService {

    List<Role> queryList(PageUtil page) throws Exception;

    void add(Role role) throws Exception;

    Map<String,Object> viewPermission(String roleId)throws Exception;
}
