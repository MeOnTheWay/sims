package com.eva.classsystem.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class SimsSignDetailInfo implements Serializable {

    //ǩ����ϸ���
    private String signDetailId;
    //Id
    private String simSignGenId;
    //ѧ��
    private String studentNo;
    //ǩ����ʽ
    private String signType;
    //ǩ��ʱ��
    private Date signTime;
    //ǩ����ַ
    private String signAddress;
    //ѡ�κ�
    private String courseCode;
    //¼��ʱ��
    private Date inputTime;
    //¼������
    private String inputDate;
    //����ʱ��
    private Date updateTime;
    //��������
    private String updateDate;
    //ǩ�����ɱ��
    private String signGenId;

    private static final long serialVersionUID = 1L;

}