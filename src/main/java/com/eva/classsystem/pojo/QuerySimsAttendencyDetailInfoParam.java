package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class QuerySimsAttendencyDetailInfoParam  implements Serializable {
    //学号
    private String studentNo;
    //学生姓名
    private String studentName;
    //选课号
    private String courseCode;
    //考勤日期
    private String attendDate;
    //考勤方式
    private String attendType;
    //考勤时间
    private String attendTime;
    //考勤地点
    private String attendAddress;
    //签到明细编号
    private String signDetailId;
    //录入时间
    private String inputTime;
    //录入日期
    private String inputDate;
    //更新时间
    private String updateTime;
    //更新日期
    private String updateDate;
    //学生成绩汇总编号
    private String attendGradeId;

}