package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.Teacher;
import com.eva.classsystem.pojo.TeacherCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;
//shiyan
//d
public interface SmisTeachercourseMapper {
   List<TeacherCourse> selectteachercourse(Integer teacherno);

   List<TeacherCourse> selectteachercourseclass(@Param("teacherno") Integer teacherno,@Param("coursename") String courseclass);

   String selectclassmsg(@Param("teacherno")Integer teacherno,@Param("coursecode") String coursecode);

   List<Integer> selectstudentbycode(String coursecode);
}