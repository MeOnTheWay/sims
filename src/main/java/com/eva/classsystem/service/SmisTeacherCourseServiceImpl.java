package com.eva.classsystem.service;

import com.eva.classsystem.mapper.SimsClassInfoMapper;
import com.eva.classsystem.mapper.SimsCourseInfoMapper;
import com.eva.classsystem.mapper.SimsStudentCourseInfoMapper;
import com.eva.classsystem.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SmisTeacherCourseServiceImpl implements SmisTeacherCourseService {

    @Autowired
    private SimsClassInfoMapper simsClassInfoMapper;

    @Autowired
    private SimsCourseInfoMapper simsCourseInfoMapper;

    @Autowired
    private SimsStudentCourseInfoMapper simsStudentCourseInfoMapper;

    @Override
    public int addSimsClassInfo(SimsClassInfo simsClassInfo) {

        simsClassInfo.setId(simsStudentCourseInfoMapper.queryCourseId());
        return simsClassInfoMapper.insert(simsClassInfo);
    }

    @Override
    public List<SimsCourseInfo> queryCourseInfoByParam(QueryCourseParam courseParam) {
        return simsCourseInfoMapper.selectCourseInfoByParam(courseParam);
    }


    @Override
    public List<SimsCourseInfo> selectTeacherCourseList(String teacherNo) {
        return simsCourseInfoMapper.selectTeacherCourseList(teacherNo);
    }

    @Override
    public List<SimsClassInfo> selectTeacherCourseClassList(String teacherno, String courseid) {
        return simsClassInfoMapper.selectTeacherCourseClassList(teacherno, courseid);
    }

    @Override
    public String selectClassMsg(String teacherno, String coursecode) {
        return simsCourseInfoMapper.selectClassMsg(teacherno, coursecode);
    }


    @Override
    public void addCourseInfo(String ID, String COURSENAME, String TEACHERNO, String INPUTTIME, String STATUS, String COURSEID,String YEAR,String TERM) {

        SimsCourseInfo courseInfo = new SimsCourseInfo();
        courseInfo.setId(ID);
        courseInfo.setCourseName(COURSENAME);
        courseInfo.setTeacherNo(TEACHERNO);
        courseInfo.setInputTime(INPUTTIME);
        courseInfo.setStatus(STATUS);
        courseInfo.setCourseId(COURSEID);
        courseInfo.setYear(YEAR);
        courseInfo.setTerm(TERM);
        simsCourseInfoMapper.insert(courseInfo);
    }



    @Override
    public void updateClass(String COURSECLASS, String COURSECODE, String ID) {
        simsCourseInfoMapper.updateClass(COURSECLASS, COURSECODE, ID);
    }


    @Override
    public void deleteClassInfo(String COURSECODE) {
        simsClassInfoMapper.deleteClassInfo(COURSECODE);
    }

    @Override
    public void deleteClassInfoMost(String COURSEID) {
        simsClassInfoMapper.deleteClassInfoMost(COURSEID);
    }

    @Override
    public void deleteCourseInfo(String COURSEID) {
        simsCourseInfoMapper.deleteCourseInfo(COURSEID);
    }

    @Override
    public SimsCourseInfo selectCourseInfoByCourseid(String COURSEID) {
        return simsCourseInfoMapper.selectCourseInfoByCourseid(COURSEID);
    }


    @Override
    public void updateCourse(String COURSENAME, String COURSEID) {
        simsCourseInfoMapper.updateCourse(COURSENAME, COURSEID);
    }

    @Override
    public void updateClassbian(String COURSECLASS, String COURSECODE) {
        simsClassInfoMapper.updateClassbian(COURSECLASS, COURSECODE);
    }

    @Override
    public SimsClassInfo selectCourseNameByCode(String courseCode) {
        return simsClassInfoMapper.selectCourseNameByCode(courseCode);
    }

    @Override
    public SimsClassInfo selectCourseInfoByInvitecode(String INVITECODE) {
        return simsClassInfoMapper.selectCourseInfoByInvitecode(INVITECODE);
    }


}
