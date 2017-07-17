package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ResultDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.ResultService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ResultServiceImpl implements ResultService {

    @Resource
    private ResultDao resultDao;

    @Override
    public List<Map<String, String>> querySearchList(SearchDto searchDto, PageUtil pageUtil) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("courseCode", searchDto.getCourseCode());
        data.put("courseName", "%" + searchDto.getCourseName() + "%");
        data.put("lessThanScore", searchDto.getLessThanScore());
        data.put("moreThanScore", searchDto.getMoreThanScore());
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getPageSize());
        pageUtil.setTotalSize(resultDao.querySearchStudentsTotalCountLikes(data));

        return resultDao.querySearchStudentsLikes(data);
    }

    @Override
    public List<Map<String, String>> queryRankList(SearchDto searchDto, PageUtil pageUtil) throws Exception {
        List<Map<String, String>> studentsTotalScores = null, studentsAverageScores = null;
        Map<String, Object> data = new HashMap<>();
        data.put("departmentId", searchDto.getDepartmentId());
        data.put("level", searchDto.getLevel());
        data.put("directionId", searchDto.getDirectionId());
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getPageSize());
        pageUtil.setTotalSize(resultDao.queryRankStudentsTotalCountLikes(data));

        List<Map<String, String>> students = resultDao.queryStudentLimit(data);
        if(students.size() == 0) return studentsTotalScores;

        List<Map<String, String>> studentsScores = resultDao.queryStudentScores(students);
        if (studentsScores.size() != 0) studentsTotalScores = getStudentsTotalScore(studentsScores, students);
        studentsAverageScores = getStudentsAverageScore(studentsTotalScores);
        sortStudentScoreDesc(studentsAverageScores);
        int endIndex = (Integer) data.get("pageSize") + (Integer) data.get("start");
        if(endIndex > studentsAverageScores.size()) endIndex = studentsAverageScores.size();

        return studentsAverageScores.subList((Integer) data.get("start"), endIndex);
    }

    private void sortStudentScoreDesc(List<Map<String, String>> studentsAverageScores) {
        for (int i = 0; i < studentsAverageScores.size() - 1; ++i)
            for (int j = i + 1; j < studentsAverageScores.size(); ++j) {
                double preScore = Double.valueOf(studentsAverageScores.get(i).get("score"));
                double currScore = Double.valueOf(studentsAverageScores.get(j).get("score"));
                if (currScore > preScore) {
                    Map<String, String> temp = studentsAverageScores.get(i);
                    studentsAverageScores.set(i, studentsAverageScores.get(j));
                    studentsAverageScores.set(j, temp);
                }
            }
    }

    private List<Map<String, String>> getStudentsAverageScore(List<Map<String, String>> studentsTotalScores) {
        for (Map<String, String> student : studentsTotalScores) {
            if (student.get("score") == null) {
                student.put("score", "0");
            } else {
                double averageScore = Double.valueOf(student.get("score")) / Integer.parseInt(student.get("courseNumber"));
                student.put("score", String.valueOf(averageScore));
            }
        }

        return studentsTotalScores;
    }


    private List<Map<String, String>> getStudentsTotalScore(List<Map<String, String>> studentsScores, List<Map<String, String>> students) {
        for (Map<String, String> studentScore : studentsScores)
            for (Map<String, String> student : students)
                setStudentTotalScore(student, studentScore);

        return students;
    }

    private void setStudentTotalScore(Map<String, String> student, Map<String, String> studentScore) {
        double courseScore = getCourseScore(studentScore);

        if (student.get("no").equals(studentScore.get("no"))) {
            if (student.get("score") == null) {
                if (courseScore != 0)
                    student.put("courseNumber", "1");
                else student.put("courseNumber", "0");
                student.put("score", String.valueOf(courseScore));
            } else {
                student.put("score", String.valueOf(Double.valueOf(student.get("score")) + courseScore));
                if (courseScore != 0)
                    student.put("courseNumber", String.valueOf(Integer.parseInt(student.get("courseNumber")) + 1));
                else
                    student.put("courseNumber", String.valueOf(Integer.parseInt(student.get("courseNumber")) - 1));
            }
        }
    }

    private double getCourseScore(Map<String, String> studentsScore) {
        try {
            return Double.valueOf(studentsScore.get("score"));
        } catch (Exception e) {//当分数为 A、B..  时 抛出异常直接返回0
            return 0;
        }
    }
}
