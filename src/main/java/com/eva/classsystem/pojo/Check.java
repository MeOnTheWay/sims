package com.eva.classsystem.pojo;

import java.io.Serializable;

public class Check  implements Serializable {
    private Integer attendance;
    private Integer late;
    private Integer absence;
    private Integer leave;

    public Integer getAttendance() {
        return attendance;
    }

    public void setAttendance(Integer attendance) {
        this.attendance = attendance;
    }

    public Integer getLate() {
        return late;
    }

    public void setLate(Integer late) {
        this.late = late;
    }

    public Integer getAbsence() {
        return absence;
    }

    public void setAbsence(Integer absence) {
        this.absence = absence;
    }

    public Integer getLeave() {
        return leave;
    }

    public void setLeave(Integer leave) {
        this.leave = leave;
    }
}
