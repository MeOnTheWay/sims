package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

@Getter
@Setter
public class SimsCourseInfo implements Serializable {
    //ID
    private String id;
    //课程名称
    private String courseName;
    //教师工号
    private String teacherNo;
    //创建时间
    private String inputTime;
    //状态
    private String status;
    //课程ID
    private String courseId;
    //学年
    private String year;
    //学期
    private String term;


}