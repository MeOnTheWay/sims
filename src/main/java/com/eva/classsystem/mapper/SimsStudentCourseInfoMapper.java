package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SimsStudentCourseInfoMapper {
    int insert(SimsStudentCourseInfo record);

    int insertSelective(SimsStudentCourseInfo record);

    List<SimsStudentCourseInfo>selectCoursecodeByStuNoList(String studentno);

    List<Integer> selectStudentByCodeList(String coursecode);

    Integer selectXkxx(String COURSECODE);

    List<SimsStudentCourseInfo>selectStuCourseInfoList(String COURSECODE);

    void deleteStudentCourseInfo(@Param("COURSECODE") String COURSECODE);


    SimsTeacherInfo selectTeacherByCode(String teacherno);




    SimsStudentInfo selectStuBynum(String studentno);





    void addStuCourseInfo(@Param("STUDENTNO") String STUDENTNO, @Param("COURSECODE") String COURSECODE, @Param("INPUTTIME") String INPUTTIME);

    List<SimsStudentNameNum>selectStudentNumName(String coursecode);

    String queryCourseId();

    String queryStuId();
}