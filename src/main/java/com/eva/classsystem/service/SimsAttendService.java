package com.eva.classsystem.service;

import com.eva.classsystem.pojo.*;

import java.util.Date;
import java.util.List;

/**
 * @Author: jiang zanzan
 * @Description: 签到
 * @Date: 2018/11/12 15:22
 */
public interface SimsAttendService {

    List<SimsAttendencyDetailInfo> selectCheckAttendanceList(String courseCode, String attendType);

    List<SimsAttendencyDetailInfo> selectCheckAttendanceOneList(QuerySimsAttendencyDetailInfoParam querySimsAttendencyDetailInfoParam);

    void updateCheck(String attendType, String coursecode, String attendDate, String STUDENTNO);

    void deleteAttendencyDetailInfoByTime(String COURSECODE, String ATTENDDATE);

    List<SimsAttendNum> selectAttenGroupList(String coursecode);

    List<SimsAttendNumEveryStu> selectAttendGroupEveryStuList (String courseCode);

    Integer selectAttendStudentalltypeList(String STUDENTNO, String COURSECODE, String ATTENDTYPE);

    void addStuAttendencyDetailInfo(String STUDENTNO, String STUDENTNAME, String COURSECODE, String ATTENDDATE, String ATTENDTYPE, String ATTENDADDRESS, String SIGNDETAILID, String INPUTTIME);



    void addStuAttendencyRecordSummary(String ATTENDGRADEID, String STUDENTNO, String STUDENTNAME, String COURSECODE, String ATTEND, String LEAVE, String LATE, String AFFAIR);

    SimsAttendencyRecordSummary selectAttSummaryByStuNum(String studentNo,String courseCode);

    void updateAttSummaryAttend(String ATTEND, String LEAVE, String LATE, String AFFAIR, String STUDENTNO,String COURSECODE);

    void updateAttSummaryAttendByParam(QuerySimsAttendencyRecordSummaryParam querySimsAttendencyRecordSummaryParam);


}
