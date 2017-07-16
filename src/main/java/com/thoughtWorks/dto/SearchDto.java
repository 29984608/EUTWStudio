package com.thoughtWorks.dto;

public class SearchDto {
    private String name;
    private String studentNo;
    private String level;
    private String classesId;
    private String departmentId;
    private String professionId;
    private String directionId;
    private String moduleId;
    private String semester;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getClassesId() {
        return classesId;
    }

    public void setClassesId(String classesId) {
        this.classesId = classesId;
    }

    public String getModuleId() {
        return moduleId;
    }

    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getProfessionId() {
        return professionId;
    }

    public void setProfessionId(String professionId) {
        this.professionId = professionId;
    }

    public String getDirectionId() {
        return directionId;
    }

    public void setDirectionId(String directionId) {
        this.directionId = directionId;
    }

    @Override
    public String toString() {
        return "SearchDto{" +
                "name='" + name + '\'' +
                ", departmentId='" + departmentId + '\'' +
                ", professionId='" + professionId + '\'' +
                ", directionId='" + directionId + '\'' +
                ", moduleId='" + moduleId + '\'' +
                ", semester='" + semester + '\'' +
                '}';
    }
}
