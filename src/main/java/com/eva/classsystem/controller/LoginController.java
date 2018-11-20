package com.eva.classsystem.controller;

import com.eva.classsystem.pojo.*;
import com.eva.classsystem.service.*;
import com.eva.classsystem.utils.RoleUtills;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.jasig.cas.client.validation.Assertion;
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
 * @Description: 用户登录
 * @Date: 2018/1/13 17:25
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private CourseController courseController;
    @Autowired
    private SimsUserService simsUserService;

    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;

    @Autowired
    private SmisStudentCourseInfoService smisStudentCourseInfoService;



    /**
     * @Author: Jiang Jiahong
     * @Description: 用户登录
     * @Date: 2018/1/13 17:57
     */
    @GetMapping(value = "/login")
    public String login(HttpServletRequest request, Model model) {

        Object object =   request.getSession().getAttribute("_const_cas_assertion_");
        if(null != object)
        {
            Assertion assertion = (Assertion)object;
            String userID = assertion.getPrincipal().getName();
            Map<String,Object> att = assertion.getPrincipal().getAttributes();
            System.out.println(userID);
            System.out.println(att);

            SimsUserInfo simsUserInfo = simsUserService.checkUser(userID);

            if(simsUserInfo!=null)
            {
                request.getSession().setAttribute("user", simsUserInfo);

                if(simsUserInfo.getRoleName().equalsIgnoreCase("teacher"))
                {
                    List<SimsCourseInfo> teacherCourses = smisTeacherCourseService.selectTeacherCourseList(userID);
                    model.addAttribute("courseList",teacherCourses);
                    model.addAttribute("teacherno",userID);


                    request.getSession().setAttribute("userRole", "teacher");

                    return "teacher/sirCourse";
                }
                else
                {
                    List<SimsStudentCourseInfo> stuclass=smisStudentCourseInfoService.selectCoursecodeByStuNoList(userID);
                    List<SimsClassInfo> stuclassall=new ArrayList<SimsClassInfo>();
                    for(SimsStudentCourseInfo list : stuclass) {
                        SimsClassInfo s= smisTeacherCourseService.selectCourseNameByCode(list.getCourseCode());
                        stuclassall.add(s);
                    }
                    model.addAttribute("stuclassall",stuclassall);

                    request.getSession().setAttribute("userRole", "student");

                    return "student/stuClass";
                }

            }


        }

        return "login";
    }


    @PostMapping(value="/loginOut")
    public String loginOut(HttpServletRequest request,Model model){

        return "login";
    }

}
