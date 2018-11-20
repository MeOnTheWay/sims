package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SimsAttendNumEveryStu {

    private String studentNo;
    private String courseCode;
    private String studentName;
    private Integer attence;
    private Integer absence;
    private Integer leave;
    private Integer late;

}
