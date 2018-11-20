package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class SimsStudentCourseInfo implements Serializable {
    private String studentNo;//学号

    private String courseCode;//选课代码

    private String inputTime;//创建时间

    private static final long serialVersionUID = 1L;

}