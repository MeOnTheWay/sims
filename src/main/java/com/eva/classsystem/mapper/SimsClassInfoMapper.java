package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SimsClassInfoMapper {
    int insert(SimsClassInfo record);

   // List<SimsCourseInfo> selectTeacherCourseList(String teacherNo);

    List<SimsClassInfo> selectTeacherCourseClassList(@Param("teacherno") String teacherno, @Param("courseid") String courseid);

    void deleteClassInfo(@Param("COURSECODE") String COURSECODE);

    void deleteClassInfoMost(@Param("COURSEID") String COURSEID);

    void updateClassbian(@Param("COURSECLASS") String COURSECLASS, @Param("COURSECODE") String COURSECODE);

    SimsClassInfo selectCourseNameByCode(String courseCode);

    SimsClassInfo selectCourseInfoByInvitecode(String INVITECODE);

}