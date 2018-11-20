package com.eva.classsystem.service;

import com.eva.classsystem.pojo.*;

import java.util.Date;
import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description:
 * @Date: 2018/1/13 16:33
 */
public interface SmisTeacherCourseService {

    int addSimsClassInfo(SimsClassInfo simsClassInfo);

    List<SimsCourseInfo> queryCourseInfoByParam(QueryCourseParam courseParam);

    List<SimsCourseInfo> selectTeacherCourseList(String teacherNo);

    List<SimsClassInfo> selectTeacherCourseClassList(String teacherno, String courseid);

    String selectClassMsg(String teacherno, String coursecode);


    void addCourseInfo(String ID, String COURSENAME, String TEACHERNO, String INPUTTIME, String STATUS, String COURSEID, String YEAR, String TERM);

    void updateClass(String COURSECLASS, String COURSECODE, String ID);


    void deleteClassInfo(String COURSECODE);

    void deleteClassInfoMost(String COURSEID);

    void deleteCourseInfo(String COURSEID);

    SimsCourseInfo selectCourseInfoByCourseid(String COURSEID);

    void updateCourse(String COURSENAME, String COURSEID);

    void updateClassbian(String COURSECLASS, String COURSECODE);

    SimsClassInfo selectCourseNameByCode(String courseCode);

    SimsClassInfo selectCourseInfoByInvitecode(String INVITECODE);

}
