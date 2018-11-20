package com.eva.classsystem.controller;

import com.eva.classsystem.pojo.SimsClassInfo;
import com.eva.classsystem.pojo.SimsCourseInfo;
import com.eva.classsystem.pojo.SimsStudentCourseInfo;
import com.eva.classsystem.pojo.SimsUserInfo;
import com.eva.classsystem.service.SimsUserService;
import com.eva.classsystem.service.SmisStudentCourseInfoService;
import com.eva.classsystem.service.SmisTeacherCourseService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.jasig.cas.client.validation.Assertion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: Jiang Jiahong
 * @Description: 纯展示的页面
 * @Date: 2018/1/12 10:05
 */
@Controller
public class HomeController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SimsUserService simsUserService;

    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;

    @Autowired
    private SmisStudentCourseInfoService smisStudentCourseInfoService;


    @GetMapping(value = "/home")
    public String home(HttpServletRequest request,Model model) {

        return "login";
    }

    /**
     * @Author: Jiang Jiahong
     * @Description: 注册首页（纯展示）
     * @Date: 2018/1/12 10:25
     */
    @GetMapping(value = "/register/registerHome")
    public String registerHome() {
        return "register/registerHome";
    }

    /**
     * @Author: Jiang Jiahong
     * @Description: 注册为学生 （纯展示）
     * @Date: 2018/1/12 10:34
     */
    @GetMapping(value = "/register/registerStu")
    public String registerToStu() {
        return "register/registerStu";
    }

    /**
     * @Author: Jiang Jiahong
     * @Description: 注册为老师（纯展示）
     * @Date: 2018/1/12 10:36
     */
    @GetMapping(value = "/register/registerSir")
    public String registerToSir() {
        return "register/registerSir";
    }

    /**
     * @Author: Jiang Jiahong
     * @Description: 忘记密码
     * @Date: 2018/1/22 12:44
     */
    @GetMapping(value = "/forgetPassword")
    public String forgetPassword() {
        return "forgetPassword";
    }

    /**
     * @Author: Jiang Jiahong
     * @Description: 教师创建班级
     * @Date: 2018/1/26 13:54
     */
    @GetMapping(value = "/createClass")
    public String createClass() {
        return "teacher/createClass";
    }

}
