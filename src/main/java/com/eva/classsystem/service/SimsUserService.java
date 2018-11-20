package com.eva.classsystem.service;

import com.eva.classsystem.pojo.SimsUserInfo;
import com.eva.classsystem.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Jiang Jiahong
 * @Description: 处理学生信息
 * @Date: 2018/1/13 15:22
 */
public interface SimsUserService {

    public SimsUserInfo checkUser(String userId);


}
