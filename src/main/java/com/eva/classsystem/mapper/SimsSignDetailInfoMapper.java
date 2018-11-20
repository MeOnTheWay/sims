package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.SimsSignDetailInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SimsSignDetailInfoMapper {
    int deleteByPrimaryKey(String signdetailid);

    int insert(SimsSignDetailInfo record);

    int insertSelective(SimsSignDetailInfo record);

    SimsSignDetailInfo selectByPrimaryKey(String signdetailid);

    int updateByPrimaryKeySelective(SimsSignDetailInfo record);

    int updateByPrimaryKey(SimsSignDetailInfo record);

    Integer selectPersoNumberInSignDetailInfo(@Param("courseCode") String coursecode, @Param("inputDate") String inputdate);

    void deleteSignDetailInfoByTime(@Param("courseCode") String COURSECODE, @Param("inputDate") String INPUTDATE);

    List<SimsSignDetailInfo> selectAlreadyAttenList(@Param("courseCode") String courseCode, @Param("inputDate") String inputDate);

    SimsSignDetailInfo selectAlreadyAttenOne(@Param("courseCode") String courseCode, @Param("inputDate") String inputDate, @Param("studentNo") String studentNo);

    void addStuSignDetail(@Param("SIGNDETAILID") String SIGNDETAILID, @Param("SIM_SIGNGENID") String SIM_SIGNGENID, @Param("STUDENTNO") String STUDENTNO, @Param("SIGNTYPE") String SIGNTYPE, @Param("SIGNADDRESS") String SIGNADDRESS, @Param("COURSECODE") String COURSECODE, @Param("INPUTDATE") String INPUTDATE);

}