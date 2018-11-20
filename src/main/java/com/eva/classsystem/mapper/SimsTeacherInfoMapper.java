package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.SimsTeacherInfo;

public interface SimsTeacherInfoMapper {

    int insert(SimsTeacherInfo record);

    int insertSelective(SimsTeacherInfo record);

    int deleteByPrimaryKey(String  teacherno);

    public SimsTeacherInfo selectByPrimaryKey(String teacherno);

    int updateByPrimaryKeySelective(SimsTeacherInfo record);

    int updateByPrimaryKey(SimsTeacherInfo record);
}