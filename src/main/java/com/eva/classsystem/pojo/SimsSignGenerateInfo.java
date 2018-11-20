package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.BLOB;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

@Setter
@Getter
public class SimsSignGenerateInfo implements Serializable {
    private String signGenId;//Id

    private String courseCode;//选课课号

    private String signType;//签到方式

    private String signDate;//签到日期

    private String signCode;//签到码

    private String qrCode;//二维码图片

    private String signAddress;//签到地址

    private String signStatus;//签到状态(是否允许签约)

    private String beginTime;//签到开始时间

    private String validTime;//签到有效时间

    private String inputTime;//录入时间

    private String inputDate;//录入日期

    private String updateTime;//更新时间

    private String updateDate;//更新日期


    private static final long serialVersionUID = 1L;

}