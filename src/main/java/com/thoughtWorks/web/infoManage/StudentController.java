package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.Experience;
import com.thoughtWorks.entity.StudentFamily;
import com.thoughtWorks.entity.StudentUpdate;
import com.thoughtWorks.service.PersonService;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.ImgUtil;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Component
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private PersonService personService;

    @RequestMapping()
    public String index() {
        return "infoManage/student/list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(PageUtil page, SearchDto searchDto) {
        Map<String, Object> data = new HashMap<>();
        try {
            List<Map<String, Object>> student = personService.queryStudentList(searchDto, page);
            data.put("student", student);
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("page", page);
            data.put("result", true);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
        }

        return data;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String, Object> update(String studentNo) {
        Map<String, Object> data = new HashMap<>();
        try {

            data.putAll(personService.updateByStudentNo(studentNo));
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("result", true);
        } catch (Exception e) {
            new RuntimeException(e);
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
        }
        return data;
    }

    @RequestMapping("/studentUpdate")
    @ResponseBody
    public Map<String, Object> studentUpdate(String studentNo) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> students = personService.queryStudentsToUpdate(studentNo);
            List<Map<String, Object>> students_family = personService.queryStudentFamily(studentNo);
            List<Map<String, String>> professionList = personService.queryStudentsProfessionList();
            List<Map<String, String>> directionList = personService.queryStudentsDirection();
            List<Map<String, Object>> classesList = personService.queryStudentsClassList();
            List<Map<String, Object>> experienceList = personService.queryStudentExperienceList(studentNo);
            List<Map<String, Object>> teacherList = personService.queryTeacherList();
            List<Map<String, Object>> departmentList = personService.queryDepartmentList();
            String famousFamily = (String) students.get("famous_family");
            Map<String, String> famousFamilyFoUpdate = personService.queryFamousFamily(famousFamily);
            data.put("students", students);
            data.put("students_family", students_family);
            data.put("professionList", professionList);
            data.put("directionList", directionList);
            data.put("classesList", classesList);
            data.put("experienceList", experienceList);
            data.put("teacherList", teacherList);
            data.put("famousFamily", famousFamilyFoUpdate);
            data.put("departmentList", departmentList);
            data.put("msg", Constant.SEARCH_SUCCESS);
            data.put("result", true);
        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            data.put("result", false);
            e.printStackTrace();
        }

        return data;
    }

    @RequestMapping("/updateStudentAjax")
    @ResponseBody()
    public Result updateStudentAjax(StudentUpdate studentUpdate,
                                    int familyInfoCount,
                                    @RequestParam(value = "educational_experience_start_list[]", required = false, defaultValue = "") List educational_experience_start_list,
                                    @RequestParam(value = "educational_experience_end_list[]", required = false, defaultValue = "") List educational_experience_end_list,
                                    @RequestParam(value = "update_schoolName_list[]", required = false, defaultValue = "") List update_schoolName_list,
                                    @RequestParam(value = "update_duties_start_list[]", required = false, defaultValue = "") List update_duties_start_list,
                                    @RequestParam(value = "experienceIds[]", required = false, defaultValue = "") List experienceIds,
                                    @RequestParam(value = "updateStudentParentsNameList[]", required = false, defaultValue = "") List updateStudentParentsNameList,
                                    @RequestParam(value = "updateStudentParent_political_statusList[]", required = false, defaultValue = "") List updateStudentParent_political_statusList,
                                    @RequestParam(value = "updateStudentParent_employerList[]", required = false, defaultValue = "") List updateStudentParent_employerList,
                                    @RequestParam(value = "updateStudentParent_dutiesList[]", required = false, defaultValue = "") List updateStudentParent_dutiesList,
                                    @RequestParam(value = "updateStudentParentIds[]", required = false, defaultValue = "") List updateStudentParentIds,
                                    @RequestParam(value = "updateStudentParent_phoneList[]", required = false, defaultValue = "") List updateStudentParent_phoneList) {

        try {
            List<Map<String, Object>> experiences = new ArrayList<>();
            for (int i = 0; i < educational_experience_start_list.size(); i++) {
                Map<String, Object> experience = new HashMap<>();
                experience.put("educational_experience_start_list", educational_experience_start_list.get(i));
                experience.put("educational_experience_end_list", educational_experience_end_list.get(i));
                experience.put("update_schoolName_list", update_schoolName_list.get(i));
                experience.put("update_duties_start_list", update_duties_start_list.get(i));
                experience.put("experienceIds", experienceIds.get(i));
                experiences.add(experience);
            }

            System.out.println("---------------------"+experiences);
            personService.updateStudentList(studentUpdate);
            if (null != experiences && experiences.size() != 0) {
                personService.updateExperienceList(experiences);
            }

            List<Map<String, Object>> familyList = new ArrayList<>();
            for (int i = 0; i < familyInfoCount; i++) {
                Map<String, Object> family = new HashMap<>();
                family.put("updateStudentParentsNameList", updateStudentParentsNameList.get(i));
                family.put("updateStudentParent_political_statusList", updateStudentParent_political_statusList.get(i));
                family.put("updateStudentParent_employerList", updateStudentParent_employerList.get(i));
                family.put("updateStudentParent_dutiesList", updateStudentParent_dutiesList.get(i));
                family.put("updateStudentParent_phoneList", updateStudentParent_phoneList.get(i));
                family.put("updateStudentParentIds", updateStudentParentIds.get(i));
                familyList.add(family);
            }
            if (null != familyList && familyList.size() != 0) {
                personService.updateFamilyInfo(familyList);
            }

            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/updateImage")
    @ResponseBody
    public Result updateImage(MultipartFile file, HttpServletRequest request) {
        try {
            String imgPath = ImgUtil.saveImg(file, request.getServletContext().getRealPath("/images") + Constant.USER_IMAGE_PATH);
            String imgName = imgPath.substring(imgPath.lastIndexOf("/"));

            return Result.success(imgName, Constant.UPLOAD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

    @RequestMapping("/addFamilyByUpdate")
    @ResponseBody
    public Result addFamilyByUpdate(StudentFamily studentFamily) {
        try {
            personService.addFamilyByUpdate(studentFamily);
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("/delStudentFamily")
    @ResponseBody
    public Result delStudentFamily(String familyId) {
        try {
            personService.delStudentFamily(familyId);

            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("/delExperience")
    @ResponseBody
    public Result delExperience(String experienceId) {
        try {
            personService.delExperience(experienceId);

            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("/addExperienceByUpdate")
    @ResponseBody
    public Result addExperienceByUpdate(Experience experience) {
        try {
            personService.addExperienceByUpdate(experience);

            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("/showAutoClassByDepartment")
    @ResponseBody
    public Result showAutoClassByDepartment(String departmentId) {
        try {
            List<Map<String, Object>> classesList = personService.showAutoClassByDepartment(departmentId);

            return Result.success(classesList, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
