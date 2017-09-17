package com.thoughtWorks.web.reportManagement;


import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.entity.StudentUpdate;
import com.thoughtWorks.service.StudentDataOutputService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/dataOutput")
public class StudentDataOutputController {

    private List<Map<String, Object>> searchInfo = new ArrayList<>();

    @Autowired
    StudentDataOutputService studentDataOutputService;

    @RequestMapping("/list")
    @ResponseBody
    public void list(StudentUpdate studentUpdate, SearchDto searchDto) {
        try {
            List<Map<String, Object>> exportedData = new ArrayList<>();
            List<Map<String, Object>> dataOutputStudents = studentDataOutputService.queryStudentList(searchDto);
            for (int count = 0;count<dataOutputStudents.size();count++) {
                Map<String, Object> singleData = new HashMap<>();
                if (studentUpdate.getNo()  != null && studentUpdate.getNo() != "") {
                    singleData.put(studentUpdate.getNo(), dataOutputStudents.get(count).get(studentUpdate.getNo()));
                }
                if (studentUpdate.getName()  != null && studentUpdate.getName() != "") {
                    singleData.put(studentUpdate.getName(), dataOutputStudents.get(count).get(studentUpdate.getName()));
                }
                if (studentUpdate.getGender()  != null && studentUpdate.getGender() != "") {
                    singleData.put(studentUpdate.getGender(), dataOutputStudents.get(count).get(studentUpdate.getGender()));
                }
                if (studentUpdate.getDepartment_id()  != null && studentUpdate.getDepartment_id() != "") {
                    singleData.put(studentUpdate.getDepartment_id(), dataOutputStudents.get(count).get(studentUpdate.getDepartment_id()));
                }
                if (studentUpdate.getDirection_id()  != null && studentUpdate.getDirection_id() != "") {
                    singleData.put(studentUpdate.getDirection_id(), dataOutputStudents.get(count).get(studentUpdate.getDirection_id()));
                }
                if (studentUpdate.getLevel()  != null && studentUpdate.getLevel() != "") {
                    singleData.put(studentUpdate.getLevel(), dataOutputStudents.get(count).get(studentUpdate.getLevel()));
                }
                if (studentUpdate.getClasses_id()  != null && studentUpdate.getClasses_id() != "") {
                    singleData.put(studentUpdate.getClasses_id(), dataOutputStudents.get(count).get(studentUpdate.getClasses_id()));
                }
                if (studentUpdate.getProfession_id()  != null && studentUpdate.getProfession_id() != "") {
                    singleData.put(studentUpdate.getProfession_id(), dataOutputStudents.get(count).get(studentUpdate.getProfession_id()));
                }
                if (studentUpdate.getOrigin_profession_id()  != null && studentUpdate.getOrigin_profession_id() != "") {
                    singleData.put(studentUpdate.getOrigin_profession_id(), dataOutputStudents.get(count).get(studentUpdate.getOrigin_profession_id()));
                }
                if (studentUpdate.getParent_name()  != null && studentUpdate.getParent_name() != "") {
                    singleData.put(studentUpdate.getParent_name(), dataOutputStudents.get(count).get(studentUpdate.getParent_name()));
                }
                if (studentUpdate.getFamous_family()  != null && studentUpdate.getFamous_family() != "") {
                    singleData.put(studentUpdate.getFamous_family(), dataOutputStudents.get(count).get(studentUpdate.getFamous_family()));
                }
                if (studentUpdate.getIdcard()  != null && studentUpdate.getIdcard() != "") {
                    singleData.put(studentUpdate.getIdcard(), dataOutputStudents.get(count).get(studentUpdate.getIdcard()));
                }
                if (studentUpdate.getBorn()  != null && studentUpdate.getBorn() != "") {
                    singleData.put(studentUpdate.getBorn(), dataOutputStudents.get(count).get(studentUpdate.getBorn()));
                }
                if (studentUpdate.getNative_place()  != null && studentUpdate.getNative_place() != "") {
                    singleData.put(studentUpdate.getNative_place(), dataOutputStudents.get(count).get(studentUpdate.getNative_place()));
                }
                if (studentUpdate.getHead_image()  != null && studentUpdate.getHead_image() != "") {
                    singleData.put(studentUpdate.getHead_image(), dataOutputStudents.get(count).get(studentUpdate.getHead_image()));
                }
                if (studentUpdate.getHealth_status()  != null && studentUpdate.getHealth_status() != "") {
                    singleData.put(studentUpdate.getHealth_status(), dataOutputStudents.get(count).get(studentUpdate.getHealth_status()));
                }
                if (studentUpdate.getStudent_type()  != null && studentUpdate.getStudent_type() != "") {
                    singleData.put(studentUpdate.getStudent_type(), dataOutputStudents.get(count).get(studentUpdate.getStudent_type()));
                }
                if (studentUpdate.getIn_school()  != null && studentUpdate.getIn_school() != "") {
                    singleData.put(studentUpdate.getIn_school(), dataOutputStudents.get(count).get(studentUpdate.getIn_school()));
                }
                if (studentUpdate.getGraduate_school()  != null && studentUpdate.getGraduate_school() != "") {
                    singleData.put(studentUpdate.getGraduate_school(), dataOutputStudents.get(count).get(studentUpdate.getGraduate_school()));
                }
                if (studentUpdate.getBlood()  != null && studentUpdate.getBlood() != "") {
                    singleData.put(studentUpdate.getBlood(), dataOutputStudents.get(count).get(studentUpdate.getBlood()));
                }
                if (studentUpdate.getHeight()  != null && studentUpdate.getHeight() != "") {
                    singleData.put(studentUpdate.getHeight(), dataOutputStudents.get(count).get(studentUpdate.getHeight()));
                }
                if (studentUpdate.getIs_marry()  != null && studentUpdate.getIs_marry() != "") {
                    singleData.put(studentUpdate.getIs_marry(), dataOutputStudents.get(count).get(studentUpdate.getIs_marry()));
                }
                if (studentUpdate.getWeight()  != null && studentUpdate.getWeight() != "") {
                    singleData.put(studentUpdate.getWeight(), dataOutputStudents.get(count).get(studentUpdate.getWeight()));
                }
                if (studentUpdate.getPolitical_status()  != null && studentUpdate.getPolitical_status() != "") {
                    singleData.put(studentUpdate.getPolitical_status(), dataOutputStudents.get(count).get(studentUpdate.getPolitical_status()));
                }
                if (studentUpdate.getPre_school_education()  != null && studentUpdate.getPre_school_education() != "") {
                    singleData.put(studentUpdate.getPre_school_education(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_education()));
                }
                if (studentUpdate.getStudent_classify()  != null && studentUpdate.getStudent_classify() != "") {
                    singleData.put(studentUpdate.getStudent_classify(), dataOutputStudents.get(count).get(studentUpdate.getStudent_classify()));
                }
                if (studentUpdate.getIdcard_address()  != null && studentUpdate.getIdcard_address() != "") {
                    singleData.put(studentUpdate.getIdcard_address(), dataOutputStudents.get(count).get(studentUpdate.getIdcard_address()));
                }
                if (studentUpdate.getActual_address()  != null && studentUpdate.getActual_address() != "") {
                    singleData.put(studentUpdate.getActual_address(), dataOutputStudents.get(count).get(studentUpdate.getActual_address()));
                }
                if (studentUpdate.getOrigin_address()  != null && studentUpdate.getOrigin_address() != "") {
                    singleData.put(studentUpdate.getOrigin_address(), dataOutputStudents.get(count).get(studentUpdate.getOrigin_address()));
                }
                if (studentUpdate.getFamily_phone()  != null && studentUpdate.getFamily_phone() != "") {
                    singleData.put(studentUpdate.getFamily_phone(), dataOutputStudents.get(count).get(studentUpdate.getFamily_phone()));
                }
                if (studentUpdate.getFamily_zip_code()  != null && studentUpdate.getFamily_zip_code() != "") {
                    singleData.put(studentUpdate.getFamily_zip_code(), dataOutputStudents.get(count).get(studentUpdate.getFamily_zip_code()));
                }
                if (studentUpdate.getStudent_contact_method()  != null && studentUpdate.getStudent_contact_method() != "") {
                    singleData.put(studentUpdate.getStudent_contact_method(), dataOutputStudents.get(count).get(studentUpdate.getStudent_contact_method()));
                }
                if (studentUpdate.getEmergency_contact_method()  != null && studentUpdate.getEmergency_contact_method() != "") {
                    singleData.put(studentUpdate.getEmergency_contact_method(), dataOutputStudents.get(count).get(studentUpdate.getEmergency_contact_method()));
                }
                if (studentUpdate.getEmergency_contact_name()  != null && studentUpdate.getEmergency_contact_name() != "") {
                    singleData.put(studentUpdate.getEmergency_contact_name(), dataOutputStudents.get(count).get(studentUpdate.getEmergency_contact_name()));
                }
                if (studentUpdate.getAccount_in()  != null && studentUpdate.getAccount_in() != "") {
                    singleData.put(studentUpdate.getAccount_in(), dataOutputStudents.get(count).get(studentUpdate.getAccount_in()));
                }
                if (studentUpdate.getEmail()  != null && studentUpdate.getEmail() != "") {
                    singleData.put(studentUpdate.getEmail(), dataOutputStudents.get(count).get(studentUpdate.getEmail()));
                }
                if (studentUpdate.getQq()  != null && studentUpdate.getQq() != "") {
                    singleData.put(studentUpdate.getQq(), dataOutputStudents.get(count).get(studentUpdate.getQq()));
                }
                if (studentUpdate.getArea_origin_name()  != null && studentUpdate.getArea_origin_name() != "") {
                    singleData.put(studentUpdate.getArea_origin_name(), dataOutputStudents.get(count).get(studentUpdate.getArea_origin_name()));
                }
                if (studentUpdate.getSat_score()  != null && studentUpdate.getSat_score() != "") {
                    singleData.put(studentUpdate.getSat_score(), dataOutputStudents.get(count).get(studentUpdate.getSat_score()));
                }
                if (studentUpdate.getPre_school_file_where_location()  != null && studentUpdate.getPre_school_file_where_location() != "") {
                    singleData.put(studentUpdate.getPre_school_file_where_location(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_file_where_location()));
                }
                if (studentUpdate.getFile_in()  != null && studentUpdate.getFile_in() != "") {
                    singleData.put(studentUpdate.getFile_in(), dataOutputStudents.get(count).get(studentUpdate.getFile_in()));
                }
                if (studentUpdate.getPre_school_name()  != null && studentUpdate.getPre_school_name() != "") {
                    singleData.put(studentUpdate.getPre_school_name(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_name()));
                }
                if (studentUpdate.getPre_school_account_where_station()  != null && studentUpdate.getPre_school_account_where_station() != "") {
                    singleData.put(studentUpdate.getPre_school_account_where_station(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_account_where_station()));
                }
                if (studentUpdate.getPre_school_work()  != null && studentUpdate.getPre_school_work() != "") {
                    singleData.put(studentUpdate.getPre_school_work(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_work()));
                }
                if (studentUpdate.getPre_school_staff()  != null && studentUpdate.getPre_school_staff() != "") {
                    singleData.put(studentUpdate.getPre_school_staff(), dataOutputStudents.get(count).get(studentUpdate.getPre_school_staff()));
                }
                if (studentUpdate.getOwn_experience()  != null && studentUpdate.getOwn_experience() != "") {
                    singleData.put(studentUpdate.getOwn_experience(), dataOutputStudents.get(count).get(studentUpdate.getOwn_experience()));
                }
                if (studentUpdate.getOwn_punishment()  != null && studentUpdate.getOwn_punishment() != "") {
                    singleData.put(studentUpdate.getOwn_punishment(), dataOutputStudents.get(count).get(studentUpdate.getOwn_punishment()));
                }
                if (studentUpdate.getStudent_status()  != null && studentUpdate.getStudent_status() != "") {
                    singleData.put(studentUpdate.getStudent_status(), dataOutputStudents.get(count).get(studentUpdate.getStudent_status()));
                }
                if (studentUpdate.getPayment_status_first_year()  != null && studentUpdate.getPayment_status_first_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_first_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_first_year()));
                }
                if (studentUpdate.getPayment_status_second_year()  != null && studentUpdate.getPayment_status_second_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_second_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_second_year()));
                }
                if (studentUpdate.getPayment_status_third_year()  != null && studentUpdate.getPayment_status_third_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_third_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_third_year()));
                }
                if (studentUpdate.getPayment_status_forth_year()  != null && studentUpdate.getPayment_status_forth_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_forth_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_forth_year()));
                }
                if (studentUpdate.getPayment_status_fifth_year()  != null && studentUpdate.getPayment_status_fifth_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_fifth_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_fifth_year()));
                }
                if (studentUpdate.getPayment_status_sixth_year()  != null && studentUpdate.getPayment_status_sixth_year() != "") {
                    singleData.put(studentUpdate.getPayment_status_sixth_year(), dataOutputStudents.get(count).get(studentUpdate.getPayment_status_sixth_year()));
                }
                if (studentUpdate.getPractice_learning_type()  != null && studentUpdate.getPractice_learning_type() != "") {
                    singleData.put(studentUpdate.getPractice_learning_type(), dataOutputStudents.get(count).get(studentUpdate.getPractice_learning_type()));
                }
                if (studentUpdate.getStay_type()  != null && studentUpdate.getStay_type() != "") {
                    singleData.put(studentUpdate.getStay_type(), dataOutputStudents.get(count).get(studentUpdate.getStay_type()));
                }
                if (studentUpdate.getOff_school_stay_address()  != null && studentUpdate.getOff_school_stay_address() != "") {
                    singleData.put(studentUpdate.getOff_school_stay_address(), dataOutputStudents.get(count).get(studentUpdate.getOff_school_stay_address()));
                }
                if (studentUpdate.getArea_id()  != null && studentUpdate.getArea_id() != "") {
                    singleData.put(studentUpdate.getArea_id(), dataOutputStudents.get(count).get(studentUpdate.getArea_id()));
                }
                if (studentUpdate.getFloor_id()  != null && studentUpdate.getFloor_id() != "") {
                    singleData.put(studentUpdate.getFloor_id(), dataOutputStudents.get(count).get(studentUpdate.getFloor_id()));
                }
                if (studentUpdate.getRoom_id()  != null && studentUpdate.getRoom_id() != "") {
                    singleData.put(studentUpdate.getRoom_id(), dataOutputStudents.get(count).get(studentUpdate.getRoom_id()));
                }
                if (studentUpdate.getCounselor_id()  != null && studentUpdate.getCounselor_id() != "") {
                    singleData.put(studentUpdate.getCounselor_id(), dataOutputStudents.get(count).get(studentUpdate.getCounselor_id()));
                }
                if (studentUpdate.getIs_out()  != null && studentUpdate.getIs_out() != "") {
                    singleData.put(studentUpdate.getIs_out(), dataOutputStudents.get(count).get(studentUpdate.getIs_out()));
                }
                if (studentUpdate.getReligion()  != null && studentUpdate.getReligion() != "") {
                    singleData.put(studentUpdate.getReligion(), dataOutputStudents.get(count).get(studentUpdate.getReligion()));
                }
                if (studentUpdate.getReligionText()  != null && studentUpdate.getReligionText() != "") {
                    singleData.put(studentUpdate.getReligionText(), dataOutputStudents.get(count).get(studentUpdate.getReligionText()));
                }
                if (studentUpdate.getHard_type()  != null && studentUpdate.getHard_type() != "") {
                    singleData.put(studentUpdate.getHard_type(), dataOutputStudents.get(count).get(studentUpdate.getHard_type()));
                }
                if (studentUpdate.getArrears_first_year()  != null && studentUpdate.getArrears_first_year() != "") {
                    singleData.put(studentUpdate.getArrears_first_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_first_year()));
                }
                if (studentUpdate.getArrears_second_year()  != null && studentUpdate.getArrears_second_year() != "") {
                    singleData.put(studentUpdate.getArrears_second_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_second_year()));
                }
                if (studentUpdate.getArrears_third_year()  != null && studentUpdate.getArrears_third_year() != "") {
                    singleData.put(studentUpdate.getArrears_third_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_third_year()));
                }
                if (studentUpdate.getArrears_forth_year()  != null && studentUpdate.getArrears_forth_year() != "") {
                    singleData.put(studentUpdate.getArrears_forth_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_forth_year()));
                }
                if (studentUpdate.getArrears_fifth_year()  != null && studentUpdate.getArrears_fifth_year() != "") {
                    singleData.put(studentUpdate.getArrears_fifth_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_fifth_year()));
                }
                if (studentUpdate.getArrears_sixth_year()  != null && studentUpdate.getArrears_sixth_year() != "") {
                    singleData.put(studentUpdate.getArrears_sixth_year(), dataOutputStudents.get(count).get(studentUpdate.getArrears_sixth_year()));
                }
                if (studentUpdate.getTeacher_id()  != null && studentUpdate.getTeacher_id() != "") {
                    singleData.put(studentUpdate.getTeacher_id(), dataOutputStudents.get(count).get(studentUpdate.getTeacher_id()));
                }
                if (studentUpdate.getCommunity_teacher_id()  != null && studentUpdate.getCommunity_teacher_id() != "") {
                    singleData.put(studentUpdate.getCommunity_teacher_id(), dataOutputStudents.get(count).get(studentUpdate.getCommunity_teacher_id()));
                }
                if (studentUpdate.getGroup()  != null && studentUpdate.getGroup() != "") {
                    singleData.put(studentUpdate.getGroup(), dataOutputStudents.get(count).get(studentUpdate.getGroup()));
                }
                if (studentUpdate.getFirst_year()  != null && studentUpdate.getFirst_year() != "") {
                    singleData.put(studentUpdate.getFirst_year(), dataOutputStudents.get(count).get(studentUpdate.getFirst_year()));
                }
                if (studentUpdate.getFirst_scholarship()  != null && studentUpdate.getFirst_scholarship() != "") {
                    singleData.put(studentUpdate.getFirst_scholarship(), dataOutputStudents.get(count).get(studentUpdate.getFirst_scholarship()));
                }
                if (studentUpdate.getFirst_stipend()  != null && studentUpdate.getFirst_stipend() != "") {
                    singleData.put(studentUpdate.getFirst_stipend(), dataOutputStudents.get(count).get(studentUpdate.getFirst_stipend()));
                }
                if (studentUpdate.getSecond_year()  != null && studentUpdate.getSecond_year() != "") {
                    singleData.put(studentUpdate.getSecond_year(), dataOutputStudents.get(count).get(studentUpdate.getSecond_year()));
                }
                if (studentUpdate.getSecond_scholarship()  != null && studentUpdate.getSecond_scholarship() != "") {
                    singleData.put(studentUpdate.getSecond_scholarship(), dataOutputStudents.get(count).get(studentUpdate.getSecond_scholarship()));
                }
                if (studentUpdate.getSecond_stipend()  != null && studentUpdate.getSecond_stipend() != "") {
                    singleData.put(studentUpdate.getSecond_stipend(), dataOutputStudents.get(count).get(studentUpdate.getSecond_stipend()));
                }
                if (studentUpdate.getThird_year()  != null && studentUpdate.getThird_year() != "") {
                    singleData.put(studentUpdate.getThird_year(), dataOutputStudents.get(count).get(studentUpdate.getThird_year()));
                }
                if (studentUpdate.getThird_scholarship()  != null && studentUpdate.getThird_scholarship() != "") {
                    singleData.put(studentUpdate.getThird_scholarship(), dataOutputStudents.get(count).get(studentUpdate.getThird_scholarship()));
                }
                if (studentUpdate.getThird_stipend()  != null && studentUpdate.getThird_stipend() != "") {
                    singleData.put(studentUpdate.getThird_stipend(), dataOutputStudents.get(count).get(studentUpdate.getThird_stipend()));
                }
                if (studentUpdate.getUnits_or_projects_practical_type()  != null && studentUpdate.getUnits_or_projects_practical_type() != "") {
                    singleData.put(studentUpdate.getUnits_or_projects_practical_type(), dataOutputStudents.get(count).get(studentUpdate.getUnits_or_projects_practical_type()));
                }
                if (studentUpdate.getUnits_or_projects_practical_type_contact()  != null && studentUpdate.getUnits_or_projects_practical_type_contact() != "") {
                    singleData.put(studentUpdate.getUnits_or_projects_practical_type_contact(), dataOutputStudents.get(count).get(studentUpdate.getUnits_or_projects_practical_type_contact()));
                }
                if (studentUpdate.getUnits_or_projects_practical_type_contact_phone()  != null && studentUpdate.getUnits_or_projects_practical_type_contact_phone() != "") {
                    singleData.put(studentUpdate.getUnits_or_projects_practical_type_contact_phone(), dataOutputStudents.get(count).get(studentUpdate.getUnits_or_projects_practical_type_contact_phone()));
                }
                if (studentUpdate.getUpdateOffCampusContactPhone()  != null && studentUpdate.getUpdateOffCampusContactPhone() != "") {
                    singleData.put(studentUpdate.getUpdateOffCampusContactPhone(), dataOutputStudents.get(count).get(studentUpdate.getUpdateOffCampusContactPhone()));
                }
                if (studentUpdate.getUpdateOffCampusContactName()  != null && studentUpdate.getUpdateOffCampusContactName() != "") {
                    singleData.put(studentUpdate.getUpdateOffCampusContactName(), dataOutputStudents.get(count).get(studentUpdate.getUpdateOffCampusContactName()));
                }
                if (studentUpdate.getOtherHealthStatus()  != null && studentUpdate.getOtherHealthStatus() != "") {
                    singleData.put(studentUpdate.getOtherHealthStatus(), dataOutputStudents.get(count).get(studentUpdate.getOtherHealthStatus()));
                }
                if (studentUpdate.getPartyOrGroupOrganization()  != null && studentUpdate.getPartyOrGroupOrganization() != "") {
                    singleData.put(studentUpdate.getPartyOrGroupOrganization(), dataOutputStudents.get(count).get(studentUpdate.getPartyOrGroupOrganization()));
                }
                if (studentUpdate.getPartyOrGroupOrganizationText()  != null && studentUpdate.getPartyOrGroupOrganizationText() != "") {
                    singleData.put(studentUpdate.getPartyOrGroupOrganizationText(), dataOutputStudents.get(count).get(studentUpdate.getPartyOrGroupOrganizationText()));
                }
                if (studentUpdate.getFirst_time_medical_insurance()  != null && studentUpdate.getFirst_time_medical_insurance() != "") {
                    singleData.put(studentUpdate.getFirst_time_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getFirst_time_medical_insurance()));
                }
                if (studentUpdate.getSecond_time_medical_insurance()  != null && studentUpdate.getSecond_time_medical_insurance() != "") {
                    singleData.put(studentUpdate.getSecond_time_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getSecond_time_medical_insurance()));
                }
                if (studentUpdate.getThird_time_medical_insurance()  != null && studentUpdate.getThird_time_medical_insurance() != "") {
                    singleData.put(studentUpdate.getThird_time_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getThird_time_medical_insurance()));
                }
                if (studentUpdate.getFirst_medical_insurance()  != null && studentUpdate.getFirst_medical_insurance() != "") {
                    singleData.put(studentUpdate.getFirst_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getFirst_medical_insurance()));
                }
                if (studentUpdate.getSecond_medical_insurance()  != null && studentUpdate.getSecond_medical_insurance() != "") {
                    singleData.put(studentUpdate.getSecond_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getSecond_medical_insurance()));
                }
                if (studentUpdate.getThird_medical_insurance()  != null && studentUpdate.getThird_medical_insurance() != "") {
                    singleData.put(studentUpdate.getThird_medical_insurance(), dataOutputStudents.get(count).get(studentUpdate.getThird_medical_insurance()));
                }
                if (studentUpdate.getPre_admissionOrReward()  != null && studentUpdate.getPre_admissionOrReward() != "") {
                    singleData.put(studentUpdate.getPre_admissionOrReward(), dataOutputStudents.get(count).get(studentUpdate.getPre_admissionOrReward()));
                }
                if (studentUpdate.getPre_admissionOrRewardText()  != null && studentUpdate.getPre_admissionOrRewardText() != "") {
                    singleData.put(studentUpdate.getPre_admissionOrRewardText(), dataOutputStudents.get(count).get(studentUpdate.getPre_admissionOrRewardText()));
                }

                System.out.println(singleData);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
