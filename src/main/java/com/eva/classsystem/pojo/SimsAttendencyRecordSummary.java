package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class SimsAttendencyRecordSummary implements Serializable {
    //考勤id
    private String attendGradeId;
    //学号
    private String studentNo;
    //学生姓名
    private String studentName;
    //选课号
    private String courseCode;
    //出勤次数
    private String attend;
    //缺勤次数
    private String leave;
    //迟到次数
    private String late;
    //请假次数
    private String affair;
    //考勤成绩
    private String attendGrade;
    //录入时间
    private Date inputTime;
    //录入日期
    private Date inputDate;
    //更新时间
    private Date updateTime;
    //更新日期
    private Date updateDate;

    private static final long serialVersionUID = 1L;

}