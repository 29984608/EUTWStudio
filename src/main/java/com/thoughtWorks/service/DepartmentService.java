package com.thoughtWorks.service;

import com.thoughtWorks.entity.Direction;
import com.thoughtWorks.entity.Profession;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface DepartmentService {
    List<Map<String,String>> queryDirectionList(PageUtil page)throws Exception;

    void insertDirection(Direction direction)throws Exception;

    void updateDirection(Direction direction)throws Exception;

    void deleteDirection(String id)throws Exception;

    List<Map<String,String>> queryProfessionList(PageUtil page)throws Exception;

    void insertProfession(Profession profession)throws Exception;

    void updateProfession(Profession profession)throws Exception;

    void deleteProfession(String id)throws Exception;
}
