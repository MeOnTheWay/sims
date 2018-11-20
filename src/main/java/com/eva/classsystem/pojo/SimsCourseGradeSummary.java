package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

@Getter
@Setter
public class SimsCourseGradeSummary extends SimsCourseGradeSummaryKey implements Serializable {
    //���
    private String id;
    //ѧ��
    private String studentNo;
    //ѧ������
    private String studentName;
    //ѡ�κ�
    private String courseCode;
    //�ɼ�
    private String grade;
    //¼��ʱ��
    private Date inputTime;
    //¼������
    private Date inputDate;
    //����ʱ��
    private Date updateTime;
    //��������
    private Date updateDate;
    //���ڳɼ����ܱ��
    private String attendGradeId;
    //ѡ�γɼ�ID
    private String courseGradeId;
    //���ĳɼ����ܱ��
    private String paperGradeId;



}