package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Direction;
import com.thoughtWorks.entity.Profession;

import java.util.List;
import java.util.Map;

public interface DepartmentDao {

    Long queryDirectTotalCount();

    List<Map<String,String>> queryDirectionList(Map<String, Object> data);

    void insertDirection(Direction direction);

    void updateDirection(Direction direction);

    void deleteDirection(String id);

    Long queryProfessionTotalCount();

    List<Map<String,String>> queryProfessionList(Map<String, Object> data);

    void insertProfession(Profession profession);

    void updateProfession(Profession profession);

    void deleteProfession(String id);
}
