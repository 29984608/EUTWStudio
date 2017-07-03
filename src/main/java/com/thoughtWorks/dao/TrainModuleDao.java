package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Course;
import com.thoughtWorks.entity.CourseModule;
import com.thoughtWorks.entity.TrainModule;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TrainModuleDao {
    Long queryTrainModuleTotalCount();

    List<Map<String,String>> queryTrainModuleList(Map<String, Object> data);

    void insertCourseModule(CourseModule courseModule);

    void updateCourseModule(CourseModule courseModule);

    void deleteCourseModule(String id);

    Long queryClassesTotalCount();


    List<Classes> queryClassesList(Map<String, Object> data);

    void deleteClasses(String id);

    void updateClasses(Classes classes);

    void addClassesManual(Classes classes);

    List<Classes> queryClassessByDepartmentId(@Param("id") String id, @Param("start") int start, @Param("end") int end);

    void updateClassTeacher(@Param("no") String no, @Param("ids") List<String> ids);

    void deleteTeacherAllClassesId(String no);

    List<Classes> loadTeacherHasClassess(String no);

    List<Classes> queryClassesByTeacherHas(String no);

    Long queryCoursesTotalCount();

    List<Map<String,String>> queryCoursesList(Map<String, Object> data);

    List<Map<String,String>> queryAllTrainModules();

    void addCourse(Course course);

    void updateCourse(Course course);

    void deleteCourse(String id);

    Long queryTrainProgramTotalCount();

    List<Classes> queryTrainPrograms(Map<String, Object> data);

    List<Map<String,String>> queryAllModuleCourses();

    void addTrainProgram(TrainModule data);

    void addProgramModuleCourses(List<Map<String, String>> data);

    List<String> queryModuleIdsByProgramId(int id);

    void deleteProgramModuleCoursesByProgramId(int id);

    void deleteProgramById(int id);
}
