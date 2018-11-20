package com.eva.classsystem.service;

import com.eva.classsystem.mapper.SimsStudentInfoMapper;
import com.eva.classsystem.mapper.SimsTeacherInfoMapper;
import com.eva.classsystem.mapper.StudentCustomMapper;
import com.eva.classsystem.pojo.*;
import com.eva.classsystem.utils.RoleUtills;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description: 处理学生业务的具体实现
 * @Date: 2018/1/13 15:23
 */
@Service
public class SimsUserServiceImpl implements SimsUserService {

    @Autowired
    private SimsStudentInfoMapper simsStudentInfoMapper;

    @Autowired
    private SimsTeacherInfoMapper simsTeacherInfoMapper;


    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;

    @Override
    public SimsUserInfo checkUser(String userId) {

        SimsUserInfo simsUserInfo = new SimsUserInfo();
        simsUserInfo =  simsStudentInfoMapper.selectByPrimaryKey(userId);

        if(simsUserInfo!=null)
        {
            simsUserInfo.setRoleName("student");
            return  simsUserInfo;
        }

        simsUserInfo = simsTeacherInfoMapper.selectByPrimaryKey(userId);
        if(simsUserInfo!=null)
        {
            simsUserInfo.setRoleName("teacher");
        }
        return simsUserInfo;

    }
}
