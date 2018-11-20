package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SimsCourseInfoMapper {
    int insert(SimsCourseInfo record);


    List<SimsCourseInfo> selectCourseInfoByParam(QueryCourseParam param);

    List<SimsCourseInfo> selectTeacherCourseList(String teacherNo);

    String selectClassMsg(@Param("teacherno") String teacherno, @Param("coursecode") String coursecode);

//    void addClass(@Param("ID") String ID, @Param("COURSENAME") String COURSENAME, @Param("TEACHERNO") String TEACHERNO, @Param("INPUTTIME") String INPUTTIME, @Param("INVITECODE") String INVITECODE, @Param("STATUS") String STATUS, @Param("COURSEID") String COURSEID);

    void updateClass(@Param("COURSECLASS") String COURSECLASS, @Param("COURSECODE") String COURSECODE, @Param("ID") String ID);





    void deleteCourseInfo(@Param("COURSEID") String COURSEID);

    SimsCourseInfo selectCourseInfoByCourseid(String COURSEID);


    void updateCourse(@Param("COURSENAME") String COURSENAME, @Param("COURSEID") String COURSEID);


}