package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.QuerySimsAttendencyDetailInfoParam;
import com.eva.classsystem.pojo.SimsAttendNum;
import com.eva.classsystem.pojo.SimsAttendNumEveryStu;
import com.eva.classsystem.pojo.SimsAttendencyDetailInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SimsAttendencyDetailInfoMapper {


    int updateByPrimaryKey(SimsAttendencyDetailInfo record);

    List<SimsAttendencyDetailInfo> selectCheckAttendanceList(@Param("courseCode") String courseCode, @Param("attendType") String attendType);

   // List<SimsAttendencyDetailInfo> selectCheckAttendanceOneList(@Param("coursecode") String coursecode, @Param("attendDate") String attendDate, @Param("attendType") String attendType);


    List<SimsAttendencyDetailInfo> selectCheckAttendanceOneList(QuerySimsAttendencyDetailInfoParam querySimsAttendencyDetailInfoParam);


    void updateCheck(@Param("attendType") String attendType, @Param("coursecode") String coursecode, @Param("attendDate") String attendDate, @Param("STUDENTNO") String STUDENTNO);

    void deleteAttendencyDetailInfoByTime(@Param("COURSECODE") String COURSECODE, @Param("ATTENDDATE") String ATTENDDATE);

    List<SimsAttendNum> selectAttenGroupList(String courseCode);

    List<SimsAttendNumEveryStu> selectAttendGroupEveryStuList (String courseCode);

    Integer selectAttendStudentalltypeList(@Param("STUDENTNO") String STUDENTNO, @Param("COURSECODE") String COURSECODE, @Param("ATTENDTYPE") String ATTENDTYPE);

    void addStuAttendencyDetailInfo(@Param("STUDENTNO") String STUDENTNO, @Param("STUDENTNAME") String STUDENTNAME, @Param("COURSECODE") String COURSECODE, @Param("ATTENDDATE") String ATTENDDATE, @Param("ATTENDTYPE") String ATTENDTYPE, @Param("ATTENDADDRESS") String ATTENDADDRESS, @Param("SIGNDETAILID") String SIGNDETAILID, @Param("INPUTTIME") String INPUTTIME);


}