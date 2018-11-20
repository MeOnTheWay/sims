package com.eva.classsystem.pojo;

import java.io.Serializable;

public class TeacherCourse implements Serializable {
    private Integer id;
    private String coursecode;

    public String getCourseclass() {
        return courseclass;
    }

    public void setCourseclass(String courseclass) {
        this.courseclass = courseclass;
    }

    private String courseclass;
    private String coursename;
    private Integer teacherno;
    private String invitecode;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public Integer getTeacherno() {
        return teacherno;
    }

    public void setTeacherno(Integer teacherno) {
        this.teacherno = teacherno;
    }

    public String getInvitecode() {
        return invitecode;
    }

    public void setInvitecode(String invitecode) {
        this.invitecode = invitecode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String status;
}