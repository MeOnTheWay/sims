package com.eva.classsystem.service;

//import com.eva.classsystem.pojo.SimsStudentCourseInfo;
import com.eva.classsystem.pojo.StudentCourse;
import com.eva.classsystem.pojo.StudentCourseInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description:
 * @Date: 2018/1/27 14:26
 */
public interface StudentCourseService {
    List<StudentCourseInfo>  selectCourseList(String stuID);
    //加入班级
    int insert(StudentCourse record);
    //退出班级
    int deleteByStuIdAndCourseId(@Param("courseid") String courseID, @Param("stuid") String stuID);
    
    
    
    
/*    //新增学生选课记录
    int insert(SimsStudentCourseInfo record);
    
   //删除学生选课记录
    int delete(@Param("coursecode") String courseCode, @Param("studentno") String studentNo);*/
    
    
    
    
}
