package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.SimsStudentInfo;

public interface SimsStudentInfoMapper {

    int insert(SimsStudentInfo record);

    int insertSelective(SimsStudentInfo record);

    SimsStudentInfo selectByPrimaryKey(String studentno);

    int updateByPrimaryKeySelective(SimsStudentInfo record);

    int updateByPrimaryKey(SimsStudentInfo record);

    int deleteByPrimaryKey(String studentno);

}