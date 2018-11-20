package com.eva.classsystem.controller;

import com.eva.classsystem.pojo.*;
import com.eva.classsystem.service.SimsAttendService;
import com.eva.classsystem.service.SimsSignService;
import com.eva.classsystem.service.SmisStudentCourseInfoService;
import com.eva.classsystem.service.SmisTeacherCourseService;
import com.eva.classsystem.utils.DateUtil;
import com.eva.classsystem.utils.LocationUtils;
import com.google.gson.Gson;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SmisStudentController {

    /***********************学生接口**********************************/

    @Autowired
    private SmisStudentCourseInfoService smisStudentCourseInfoService;
    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;
    @Autowired
    private SimsSignService simsSignService;
    @Autowired
    private SimsAttendService simsAttendService;
    @PostMapping(value = "/stuclass.do")
    public String stuclass(String studentno, Model model, HttpServletRequest request){
        List<SimsStudentCourseInfo> stuclass=smisStudentCourseInfoService.selectCoursecodeByStuNoList(studentno);
        List<SimsClassInfo> stuclassall=new ArrayList<SimsClassInfo>();
        for(SimsStudentCourseInfo list : stuclass) {
            SimsClassInfo s= smisTeacherCourseService.selectCourseNameByCode(list.getCourseCode());
            stuclassall.add(s);
        }
        HttpSession session=request.getSession();
        session.setAttribute("studentno",studentno);
        model.addAttribute("stuclassall",stuclassall);

        return "student/stuClass";
    }

    @PostMapping(value = "/stucheck.do")
    public String stucheck(String teacherno, Model model, String coursename, String coursecode){
        String teachername=smisStudentCourseInfoService.selectTeacherByCode(teacherno).getUserName();
        model.addAttribute("coursecode",coursecode);
        model.addAttribute("coursename",coursename);
        model.addAttribute("teachername",teachername);
        return "student/stuSignClass";
    }

    @PostMapping(value = "/addstucheck.do")
    public @ResponseBody
    String addstucheck(String checkma,String coursecode,String signAddress,HttpServletRequest request) throws ParseException {
        SimsSignAddressPojo stuAddress=new Gson().fromJson(signAddress,SimsSignAddressPojo.class);
//        System.out.println(stuAddress.getLatitude()+"   "+stuAddress.getLongitude());
        SimsSignGenerateInfo s = simsSignService.selectQianDaoBiaoByCode(coursecode);

        SimsSignAddressPojo teacherAddress=new Gson().fromJson(s.getSignAddress(),SimsSignAddressPojo.class);
//        System.out.println(teacherAddress.getLatitude()+"   "+teacherAddress.getLongitude());
        Double distance=LocationUtils.getDistance(stuAddress.getLatitude(),stuAddress.getLongitude(),teacherAddress.getLatitude(),teacherAddress.getLongitude());
//        System.out.println("11111111111111111111");
//        System.out.println(distance);
        SimsStudentInfo student = (SimsStudentInfo) request.getSession().getAttribute("user");
        String studentno=student.getUserId();
        String Stuname=smisStudentCourseInfoService.selectStuBynum(studentno).getUserName();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
       // Date date1=new Date();

        String date1= DateUtil.getWebTodayString();

        String date= DateUtil.getWebTodayString();
        String date2=DateUtil.getWebTodayString();
        if(distance<100){
            if(s.getSignCode().equals(checkma)){
                String id=smisStudentCourseInfoService.queryCourseId();
                String sid=smisStudentCourseInfoService.queryStuId();
                simsSignService.addStuSignDetail(id,id,studentno,"1",signAddress,coursecode,date);
                simsAttendService.addStuAttendencyDetailInfo(studentno,Stuname,coursecode,date2,"出勤",signAddress,id,date1);
                SimsAttendencyRecordSummary stuNum=simsAttendService.selectAttSummaryByStuNum(studentno,coursecode);
                if(stuNum==null){
                    simsAttendService.addStuAttendencyRecordSummary(sid,studentno,Stuname,coursecode,"1","0","0","0");
                }else{
                    int num=Integer.valueOf(stuNum.getAttend());
                    num+=1;
                    String num1=String.valueOf(num);
                    simsAttendService.updateAttSummaryAttend(num1,stuNum.getLeave(),stuNum.getLate(),stuNum.getAffair(),studentno,coursecode);
                }

                return "true";
            }else{
                return "false";
            }
        }else{
            return "outdistance";
        }


    }

    @GetMapping(value = "/inviteStu")
    public String inviteStu(HttpServletRequest request, Model model){
        SimsStudentInfo student = (SimsStudentInfo) request.getSession().getAttribute("user");
        String studentno=student.getUserId();
        model.addAttribute("studentno",studentno);
        return "student/joinClass";
    }

    @PostMapping(value = "/inviteLast.do")
    public @ResponseBody
    String inviteLast(String invitecode,HttpServletRequest request){
        System.out.println("123132133");
        SimsClassInfo s = smisTeacherCourseService.selectCourseInfoByInvitecode(invitecode);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=new Date();
        String datestr=df.format(date);
        SimsStudentInfo student = (SimsStudentInfo) request.getSession().getAttribute("user");
        String studentno=student.getUserId();
        if(s==null){
            return "false";
        }else{
            smisStudentCourseInfoService.addStuCourseInfo(studentno,s.getCourseCode(),datestr);
            return "true";
        }

    }

    @PostMapping(value = "/adress.do")
    public String adress (){
        return "";
    }

    @PostMapping(value = "/checkIf.do")
    public @ResponseBody
    String checkIf(String coursecode,HttpServletRequest request){
        SimsSignGenerateInfo sgi=simsSignService.selectQianDaoBiaoByCode(coursecode);
        if(sgi==null)
        {
            return "false";
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String date=df.format(new Date());
        SimsStudentInfo student = (SimsStudentInfo) request.getSession().getAttribute("user");


        SimsSignDetailInfo s=simsSignService.selectAlreadyAttenOne(coursecode,date,student.getUserId());

        if(s==null){
            return "true";
        }
        else{
            return  "already";
        }

    }


}
