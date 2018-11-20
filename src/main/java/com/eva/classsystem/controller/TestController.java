package com.eva.classsystem.controller;

import com.eva.classsystem.pojo.*;
import com.eva.classsystem.service.CourseServiceImpl;
import com.eva.classsystem.service.SmisStudentCourseInfoService;
import com.eva.classsystem.service.SmisTeacherCourseService;
import com.eva.classsystem.service.StudentCourseServiceImpl;
import com.eva.classsystem.utils.RoleUtills;
import com.eva.classsystem.utils.Utils;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/test")
public class TestController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/r1")//默认为get方式
    public String test(){
        System.out.println("testts");
        return "test";
    }

}
