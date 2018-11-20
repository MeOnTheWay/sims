package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

@Getter
@Setter
public class SimsCourseGradeSummary extends SimsCourseGradeSummaryKey implements Serializable {
    //序号
    private String id;
    //学号
    private String studentNo;
    //学生姓名
    private String studentName;
    //选课号
    private String courseCode;
    //成绩
    private String grade;
    //录入时间
    private Date inputTime;
    //录入日期
    private Date inputDate;
    //更新时间
    private Date updateTime;
    //更新日期
    private Date updateDate;
    //考勤成绩汇总编号
    private String attendGradeId;
    //选课成绩ID
    private String courseGradeId;
    //论文成绩汇总编号
    private String paperGradeId;



}