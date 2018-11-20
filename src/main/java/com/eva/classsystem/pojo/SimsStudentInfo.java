package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class SimsStudentInfo extends SimsUserInfo{

    //专业
    private String major;
    //手机号码
    private String mobilePhone;
}