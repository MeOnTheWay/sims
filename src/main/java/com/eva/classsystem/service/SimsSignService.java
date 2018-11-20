package com.eva.classsystem.service;

import com.eva.classsystem.pojo.QuerySignGenerateInfoParam;
import com.eva.classsystem.pojo.SimsSignDetailInfo;
import com.eva.classsystem.pojo.SimsSignGenerateInfo;
import com.eva.classsystem.pojo.SimsUserInfo;

import java.util.Date;
import java.util.List;

/**
 * @Author: jiang zanzan
 * @Description: 签到
 * @Date: 2018/11/12 15:22
 */
public interface SimsSignService {

    void deleteSignGenerateInfoByStatuslishi(String SIGNSTATUS, String COURSECODE, String SIGNDATE);

    void addSign(String COURSECODE, String SIGNTYPE, String SIGNDATE, String SIGNCODE, String SIGNADDRESS, String SIGNSTATUS, String BEGINTIME, String VALIDTIME, String INPUTTIME);

    void updateSignGenerateInfoStatus(String SIGNSTATUS, String COURSECODE, String SIGNDATE);

    void deleteSignGenerateInfoByStatus(String SIGNSTATUS, String COURSECODE);

    List<SimsSignGenerateInfo> selectIfSignGenrateInfo(QuerySignGenerateInfoParam querySignGenerateInfoParam);

    SimsSignGenerateInfo selectQianDaoBiaoByCode(String coursecode);

    Integer selectPersoNumberInSignDetailInfo(String coursecode, String inputdate);

    void deleteSignDetailInfoByTime(String COURSECODE, String INPUTDATE);

    List<SimsSignDetailInfo>selectAlreadyAttenList(String COURSECODE, String INPUTDATE);

    SimsSignDetailInfo selectAlreadyAttenOne(String COURSECODE, String INPUTDATE, String STUDENTNO);

    void addStuSignDetail(String SIGNDETAILID, String SIM_SIGNGENID, String STUDENTNO, String SIGNTYPE, String SIGNADDRESS, String COURSECODE, String INPUTDATE);


}
