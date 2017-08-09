package com.thoughtWorks.entity;

import java.util.Date;

public class CommunicationContent {
    private long id;
    private String teacherId;
    private String studentId;
    private String talkName;
    private String direction;
    private String content;
    private Date time;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getTalkName() {
        return talkName;
    }

    public void setTalkName(String talkName) {
        this.talkName = talkName;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "CommunicationContent{" +
                "id=" + id +
                ", teacherId='" + teacherId + '\'' +
                ", studentId='" + studentId + '\'' +
                ", talkName='" + talkName + '\'' +
                ", direction='" + direction + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                '}';
    }
}
