package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Department;
import com.thoughtWorks.entity.Direction;
import com.thoughtWorks.entity.Profession;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DepartmentDao {

    Long queryDirectTotalCount();

    List<Map<String, String>> queryDirectionList(Map<String, Object> data);

    void insertDirection(Direction direction);

    void updateDirection(Direction direction);

    void deleteDirection(String id);

    Long queryProfessionTotalCount();

    List<Map<String, String>> queryProfessionList(Map<String, Object> data);

    void insertProfession(Profession profession);

    void updateProfession(Profession profession);

    void deleteProfession(String id);

    Long queryDepartmentTotalCount();

    List<Map<String, String>> queryDepartmentList(Map<String, Object> data);

    int addDepartment(Department department);

    void updateDirectionDepartmentId(@Param("id") int id, @Param("directions") List<String> directions);

    void updateProfessionDepartmentId(@Param("id") int id, @Param("professions") List<String> professions);

    List<String> queryProfessionsByDepartmentId(String id);

    List<String> queryDirectionsByDepartmentId(String id);

    void updateDepartment(Department department);

    void deleteDirectionsDepartmentId(@Param("ids") List<String> ids);

    void deleteProfessionsDepartmentId(@Param("ids") List<String> ids);

    void insertProfessionsDepartmentIds(@Param("departmentId") int id, @Param("ids") List<String> ids);

    void insertDirectionsDepartmentIds(@Param("departmentId") int id, @Param("ids") List<String> ids);

    void deleteDirectionDepartmentIdByDepartmentId(String id);

    void deleteProfessionDepartmentIdByDepartmentId(String id);

    void deleteDepartment(String id);

    List<Department> queryAllDepartments();
}
