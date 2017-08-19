package com.thoughtWorks.entity;

public class OwnOrPunishment {
    private String date;
    private String centent;
    private String studentNo;

    public OwnOrPunishment() {
    }

    public OwnOrPunishment(String date, String centent, String studentNo) {
        this.date = date;
        this.centent = centent;
        this.studentNo = studentNo;
    }

    public String getCentent() {
        return centent;
    }

    public void setCentent(String centent) {
        this.centent = centent;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OwnOrPunishment{" +
                "date='" + date + '\'' +
                ", centent='" + centent + '\'' +
                ", studentNo='" + studentNo + '\'' +
                '}';
    }
}
