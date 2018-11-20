package com.eva.classsystem.service;

import com.eva.classsystem.mapper.SimsSignDetailInfoMapper;
import com.eva.classsystem.mapper.SimsSignGenerateInfoMapper;
import com.eva.classsystem.mapper.SimsStudentInfoMapper;
import com.eva.classsystem.mapper.SimsTeacherInfoMapper;
import com.eva.classsystem.pojo.QuerySignGenerateInfoParam;
import com.eva.classsystem.pojo.SimsSignDetailInfo;
import com.eva.classsystem.pojo.SimsSignGenerateInfo;
import com.eva.classsystem.pojo.SimsUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description: 处理学生业务的具体实现
 * @Date: 2018/1/13 15:23
 */
@Service
public class SimsSignServiceImpl implements SimsSignService {

    @Autowired
    private SimsSignGenerateInfoMapper simsSignGenerateInfoMapper;

    @Autowired
    private SimsSignDetailInfoMapper simsSignDetailInfoMapper;


    @Override
    public void deleteSignGenerateInfoByStatuslishi(String SIGNSTATUS, String COURSECODE, String SIGNDATE) {
        simsSignGenerateInfoMapper.deleteSignGenerateInfoByStatuslishi(SIGNSTATUS, COURSECODE, SIGNDATE);
    }

    @Override
    public void addSign(String courseCode, String signType, String signDate, String signCode, String signAddress, String signStatus, String beginTime, String  validTime, String inputTime) {

       SimsSignGenerateInfo signGenerateInfo = new SimsSignGenerateInfo();

        signGenerateInfo.setCourseCode(courseCode);
        signGenerateInfo.setSignType(signType);
        signGenerateInfo.setSignCode(signCode);
        signGenerateInfo.setSignDate(signDate);
        signGenerateInfo.setSignAddress(signAddress);
        signGenerateInfo.setSignStatus(signStatus);
        signGenerateInfo.setBeginTime(beginTime);
        signGenerateInfo.setValidTime(validTime);
        signGenerateInfo.setInputTime(inputTime);

        simsSignGenerateInfoMapper.insert(signGenerateInfo);
    }

    @Override
    public void updateSignGenerateInfoStatus(String SIGNSTATUS, String COURSECODE, String SIGNDATE) {
        simsSignGenerateInfoMapper.updateSignGenerateInfoStatus(SIGNSTATUS, COURSECODE, SIGNDATE);
    }

    @Override
    public void deleteSignGenerateInfoByStatus(String SIGNSTATUS, String COURSECODE) {
        simsSignGenerateInfoMapper.deleteSignGenerateInfoByStatus(SIGNSTATUS, COURSECODE);
    }

    @Override
    public List<SimsSignGenerateInfo> selectIfSignGenrateInfo(QuerySignGenerateInfoParam querySignGenerateInfoParam) {
        return simsSignGenerateInfoMapper.selectIfSignGenrateInfo(querySignGenerateInfoParam);
    }

    @Override
    public SimsSignGenerateInfo selectQianDaoBiaoByCode(String coursecode) {
        return simsSignGenerateInfoMapper.selectQianDaoBiaoByCode(coursecode);
    }

    @Override
    public Integer selectPersoNumberInSignDetailInfo(String coursecode, String inputdate) {
        return simsSignDetailInfoMapper.selectPersoNumberInSignDetailInfo(coursecode, inputdate);
    }

    @Override
    public void deleteSignDetailInfoByTime(String COURSECODE, String INPUTDATE) {
        simsSignDetailInfoMapper.deleteSignDetailInfoByTime(COURSECODE, INPUTDATE);
    }

    @Override
    public List<SimsSignDetailInfo> selectAlreadyAttenList(String COURSECODE, String INPUTDATE) {
        return simsSignDetailInfoMapper.selectAlreadyAttenList(COURSECODE, INPUTDATE);
    }

    @Override
    public SimsSignDetailInfo selectAlreadyAttenOne(String COURSECODE, String INPUTDATE, String STUDENTNO) {
        return simsSignDetailInfoMapper.selectAlreadyAttenOne(COURSECODE, INPUTDATE, STUDENTNO);
    }

    @Override
    public void addStuSignDetail(String SIGNDETAILID, String SIM_SIGNGENID, String STUDENTNO, String SIGNTYPE, String SIGNADDRESS, String COURSECODE, String INPUTDATE) {
        simsSignDetailInfoMapper.addStuSignDetail(SIGNDETAILID, SIM_SIGNGENID, STUDENTNO, SIGNTYPE, SIGNADDRESS, COURSECODE, INPUTDATE);
    }


}
