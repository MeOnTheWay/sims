package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class SimsAttendNum {

    private String attendDate;
    private String courseCode;
    private Integer attence;
    private Integer absence;
    private Integer leave;
    private Integer late;

}
