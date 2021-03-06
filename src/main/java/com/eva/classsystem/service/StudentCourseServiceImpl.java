package com.eva.classsystem.service;

/*import com.eva.classsystem.mapper.SimsStudentCourseInfoMapper;
import com.eva.classsystem.pojo.SimsStudentCourseInfo;*/
import com.eva.classsystem.mapper.StudentCourseCustomMapper;

import com.eva.classsystem.pojo.StudentCourse;
import com.eva.classsystem.pojo.StudentCourseInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description:
 * @Date: 2018/1/27 14:26
 */
@Service
public class StudentCourseServiceImpl implements StudentCourseService {
    @Autowired
    StudentCourseCustomMapper studentCourseCustomMapper;
/*    
    @Autowired
    SimsStudentCourseInfoMapper simsStudentCourseInfoMapper;*/
    
    @Override
    public  List<StudentCourseInfo>  selectCourseList(String stuID) {
        return studentCourseCustomMapper.selectCourseList(stuID);
    }

    @Override
    public int insert(StudentCourse record) {
        return studentCourseCustomMapper.insert(record);
    }

    @Override
   public int deleteByStuIdAndCourseId(@Param("courseid") String courseID, @Param("stuid") String stuID){
        return studentCourseCustomMapper.deleteByStuIdAndCourseId(courseID,stuID);
    }

/*	@Override
	public int insert(SimsStudentCourseInfo record) {
		return simsStudentCourseInfoMapper.insert(record);
	}

	@Override
	public int delete(String courseCode, String studentNo) {
		return 0;
	}
    
    */
    
    //2018-10-15
}
