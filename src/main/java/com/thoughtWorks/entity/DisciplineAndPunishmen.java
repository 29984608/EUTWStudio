package com.thoughtWorks.entity;

public class DisciplineAndPunishmen {
    private String date;
    private String content;
    private String studentNo;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    @Override
    public String toString() {
        return "DisciplineAndPunishmen{" +
                "date='" + date + '\'' +
                ", content='" + content + '\'' +
                ", studentNo='" + studentNo + '\'' +
                '}';
    }
}
