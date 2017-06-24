package com.thoughtWorks.service;

import com.thoughtWorks.entity.Role;
import com.thoughtWorks.util.PageUtil;

import java.util.List;

public interface RoleService {

    List<Role> queryList(PageUtil page);
}
