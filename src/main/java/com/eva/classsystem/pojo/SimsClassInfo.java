package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SimsClassInfo implements Serializable {
    //Id
    private String id;
    //选课号
    private String courseCode;
    //课程名
    private String courseName;
    //教师id
    private String teacherNo;
    //录入事件
    private String inputTime;
    //邀请码
    private String inviteCode;
    //状态
    private String status;
    //班级名
    private String courseClass;
    //课程id
    private String courseId;


}