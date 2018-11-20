package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.QuerySimsAttendencyRecordSummaryParam;
import com.eva.classsystem.pojo.SimsAttendencyRecordSummary;
import org.apache.ibatis.annotations.Param;

public interface SimsAttendencyRecordSummaryMapper {
    int deleteByPrimaryKey(String attendgradeid);

    int updateByPrimaryKey(SimsAttendencyRecordSummary record);

    void addStuAttendencyRecordSummary(@Param("ATTENDGRADEID") String ATTENDGRADEID, @Param("STUDENTNO") String STUDENTNO, @Param("STUDENTNAME") String STUDENTNAME, @Param("COURSECODE") String COURSECODE, @Param("ATTEND") String ATTEND, @Param("LEAVE") String LEAVE, @Param("LATE") String LATE, @Param("AFFAIR") String AFFAIR);

    SimsAttendencyRecordSummary selectAttSummaryByStuNum(@Param("studentNo")String studentNo,@Param("courseCode")String courseCode);

    void updateAttSummaryAttend(@Param("ATTEND") String ATTEND, @Param("LEAVE") String LEAVE, @Param("LATE") String LATE, @Param("AFFAIR") String AFFAIR, @Param("STUDENTNO") String STUDENTNO, @Param("COURSECODE") String COURSECODE);


    void updateAttSummaryAttendByParam(QuerySimsAttendencyRecordSummaryParam param);


}