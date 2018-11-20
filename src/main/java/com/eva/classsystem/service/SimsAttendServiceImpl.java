package com.eva.classsystem.service;

import com.eva.classsystem.mapper.SimsAttendencyDetailInfoMapper;
import com.eva.classsystem.mapper.SimsAttendencyRecordSummaryMapper;
import com.eva.classsystem.mapper.SimsSignDetailInfoMapper;
import com.eva.classsystem.mapper.SimsSignGenerateInfoMapper;
import com.eva.classsystem.pojo.*;
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
public class SimsAttendServiceImpl implements SimsAttendService {

    @Autowired
    private SimsAttendencyDetailInfoMapper simsAttendencyDetailInfoMapper;

    @Autowired
    private SimsAttendencyRecordSummaryMapper simsAttendencyRecordSummaryMapper;

    @Override
    public List<SimsAttendencyDetailInfo> selectCheckAttendanceList(String courseCode, String attendType) {
        return simsAttendencyDetailInfoMapper.selectCheckAttendanceList(courseCode, attendType);
    }

    @Override
    public List<SimsAttendencyDetailInfo> selectCheckAttendanceOneList(QuerySimsAttendencyDetailInfoParam querySimsAttendencyDetailInfoParam) {

        return simsAttendencyDetailInfoMapper.selectCheckAttendanceOneList(querySimsAttendencyDetailInfoParam);
    }

    @Override
    public void updateCheck(String attendType, String coursecode, String attendDate, String STUDENTNO) {
        simsAttendencyDetailInfoMapper.updateCheck(attendType, coursecode, attendDate, STUDENTNO);
    }

    @Override
    public void deleteAttendencyDetailInfoByTime(String COURSECODE, String ATTENDDATE) {
        simsAttendencyDetailInfoMapper.deleteAttendencyDetailInfoByTime(COURSECODE, ATTENDDATE);
    }

    @Override
    public List<SimsAttendNum> selectAttenGroupList(String courseCode) {
        return simsAttendencyDetailInfoMapper.selectAttenGroupList(courseCode);
    }

    @Override
    public List<SimsAttendNumEveryStu> selectAttendGroupEveryStuList(String courseCode) {
        return simsAttendencyDetailInfoMapper.selectAttendGroupEveryStuList(courseCode);
    }

    @Override
    public Integer selectAttendStudentalltypeList(String STUDENTNO, String COURSECODE, String ATTENDTYPE) {
        return simsAttendencyDetailInfoMapper.selectAttendStudentalltypeList(STUDENTNO, COURSECODE, ATTENDTYPE);
    }

    @Override
    public void addStuAttendencyDetailInfo(String STUDENTNO, String STUDENTNAME, String COURSECODE, String ATTENDDATE, String ATTENDTYPE, String ATTENDADDRESS, String SIGNDETAILID, String INPUTTIME) {
        simsAttendencyDetailInfoMapper.addStuAttendencyDetailInfo(STUDENTNO, STUDENTNAME, COURSECODE, ATTENDDATE, ATTENDTYPE, ATTENDADDRESS, SIGNDETAILID, INPUTTIME);
    }

    @Override
    public void addStuAttendencyRecordSummary(String ATTENDGRADEID, String STUDENTNO, String STUDENTNAME, String COURSECODE, String ATTEND, String LEAVE, String LATE, String AFFAIR) {
        simsAttendencyRecordSummaryMapper.addStuAttendencyRecordSummary(ATTENDGRADEID, STUDENTNO, STUDENTNAME, COURSECODE, ATTEND, LEAVE, LATE, AFFAIR);
    }

    @Override
    public SimsAttendencyRecordSummary selectAttSummaryByStuNum(String studentNo,String courseCode) {
        return simsAttendencyRecordSummaryMapper.selectAttSummaryByStuNum(studentNo,courseCode);
    }

    @Override
    public void updateAttSummaryAttend(String ATTEND, String LEAVE, String LATE, String AFFAIR, String STUDENTNO,String COURSECODE) {
        simsAttendencyRecordSummaryMapper.updateAttSummaryAttend(ATTEND, LEAVE, LATE, AFFAIR, STUDENTNO,COURSECODE);
    }

    @Override
    public void updateAttSummaryAttendByParam(QuerySimsAttendencyRecordSummaryParam querySimsAttendencyRecordSummaryParam) {

        simsAttendencyRecordSummaryMapper.updateAttSummaryAttendByParam(querySimsAttendencyRecordSummaryParam);
    }


}
