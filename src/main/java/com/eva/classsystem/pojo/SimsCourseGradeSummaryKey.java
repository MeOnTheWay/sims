package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Arrays;

@Setter
@Getter
public class SimsCourseGradeSummaryKey implements Serializable {
    private String studentno;

    private String courseCode;

    private static final long serialVersionUID = 1L;


}