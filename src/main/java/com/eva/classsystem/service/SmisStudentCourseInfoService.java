package com.eva.classsystem.service;

import com.eva.classsystem.pojo.*;

import java.util.Date;
import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description:
 * @Date: 2018/1/13 16:33
 */
public interface SmisStudentCourseInfoService {
    int insert(SimsStudentCourseInfo record);

    int insertSelective(SimsStudentCourseInfo record);

    List<SimsStudentCourseInfo>selectCoursecodeByStuNoList(String studentno);

    List<Integer> selectStudentByCodeList(String coursecode);

    Integer selectXkxx(String COURSECODE);

    List<SimsStudentCourseInfo>selectStuCourseInfoList(String COURSECODE);

    void deleteStudentCourseInfo(String COURSECODE);

    SimsTeacherInfo selectTeacherByCode(String teacherno);

    SimsStudentInfo selectStuBynum(String studentno);

    void addStuCourseInfo(String STUDENTNO, String COURSECODE, String INPUTTIME);

    List<SimsStudentNameNum>selectStudentNumName(String coursecode);

    String queryCourseId();

    String queryStuId();

}
