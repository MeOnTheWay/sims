package com.eva.classsystem.service;

import com.eva.classsystem.mapper.SimsStudentCourseInfoMapper;
import com.eva.classsystem.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SmisStudentCourseInfoServiceImpl implements SmisStudentCourseInfoService {

    @Autowired
    private SimsStudentCourseInfoMapper simsStudentCourseInfoMapper;


    @Override
    public int insert(SimsStudentCourseInfo record) {
        return simsStudentCourseInfoMapper.insert(record);
    }

    @Override
    public int insertSelective(SimsStudentCourseInfo record) {
        return simsStudentCourseInfoMapper.insertSelective(record);
    }

    @Override
    public List<SimsStudentCourseInfo> selectCoursecodeByStuNoList(String studentno) {
        return simsStudentCourseInfoMapper.selectCoursecodeByStuNoList(studentno);
    }

    @Override
    public List<Integer> selectStudentByCodeList(String coursecode) {
        return simsStudentCourseInfoMapper.selectStudentByCodeList(coursecode);
    }

    @Override
    public Integer selectXkxx(String COURSECODE) {
        return simsStudentCourseInfoMapper.selectXkxx(COURSECODE);
    }

    @Override
    public List<SimsStudentCourseInfo> selectStuCourseInfoList(String COURSECODE) {
        return simsStudentCourseInfoMapper.selectStuCourseInfoList(COURSECODE);
    }

    @Override
    public void deleteStudentCourseInfo(String COURSECODE) {
        simsStudentCourseInfoMapper.deleteStudentCourseInfo(COURSECODE);
    }


    @Override
    public SimsTeacherInfo selectTeacherByCode(String teacherno) {
        return simsStudentCourseInfoMapper.selectTeacherByCode(teacherno);
    }


    @Override
    public SimsStudentInfo selectStuBynum(String studentno) {
        return simsStudentCourseInfoMapper.selectStuBynum(studentno);
    }



    @Override
    public void addStuCourseInfo(String STUDENTNO, String COURSECODE, String INPUTTIME) {
        simsStudentCourseInfoMapper.addStuCourseInfo(STUDENTNO, COURSECODE, INPUTTIME);
    }

    @Override
    public List<SimsStudentNameNum> selectStudentNumName(String coursecode) {
        return simsStudentCourseInfoMapper.selectStudentNumName(coursecode);
    }

    @Override
    public String queryCourseId() {
        return simsStudentCourseInfoMapper.queryCourseId();
    }

    @Override
    public String queryStuId() {
        return simsStudentCourseInfoMapper.queryStuId();
    }
}
