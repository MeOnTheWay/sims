package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.SimsCourseGradeInfo;

public interface SimsCourseGradeInfoMapper {
    int deleteByPrimaryKey(String coursegradeid);

    int insert(SimsCourseGradeInfo record);

    int insertSelective(SimsCourseGradeInfo record);

    SimsCourseGradeInfo selectByPrimaryKey(String coursegradeid);

    int updateByPrimaryKeySelective(SimsCourseGradeInfo record);

    int updateByPrimaryKeyWithBLOBs(SimsCourseGradeInfo record);

    int updateByPrimaryKey(SimsCourseGradeInfo record);
}