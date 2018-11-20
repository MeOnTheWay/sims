package com.eva.classsystem.controller;

import com.eva.classsystem.pojo.*;
import com.eva.classsystem.service.SimsAttendService;
import com.eva.classsystem.service.SimsSignService;
import com.eva.classsystem.service.SmisStudentCourseInfoService;
import com.eva.classsystem.service.SmisTeacherCourseService;
import com.eva.classsystem.utils.*;
import oracle.jdbc.proxy.annotation.Post;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: jiangzanzan
 * @Description:
 * @Date: 2018/1/27 12:25
 */
@Controller
public class SmisTeacherController {

    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;

    @Autowired
    private SmisStudentCourseInfoService smisStudentCourseInfoService;

    @Autowired
    private SimsSignService simsSignService;

    @Autowired
    private SimsAttendService simsAttendService;
    @GetMapping(value = "/teachercourse.do")
    public String teachercourse(HttpServletRequest request, String id, Model model){
            return "teacher/sirCourse";
  }

  @PostMapping(value = "/teacherCourseClass")
    public String teachercourseclass(String teacherno ,String courseid,Model model){
        List<SimsClassInfo> teacherCourseclass=smisTeacherCourseService.selectTeacherCourseClassList(teacherno, courseid);
        int flag=1;
        for(SimsClassInfo s:teacherCourseclass){
            if(s.getCourseCode()==null||s.getCourseCode()==""){
                flag=0;
            }
        }
        List<SimsClassInfo>list=new ArrayList<SimsClassInfo>();
      if (flag==0) {
          model.addAttribute("teacherCourseclass",list);
      }
      else{
          model.addAttribute("teacherCourseclass",teacherCourseclass);
      }
      model.addAttribute("courseId",courseid);
        return "teacher/sirClassRoom";
  }

    @PostMapping(value = "/checkCourseclassall.do")
    public String checkCourseclassall(String courseCode, Model model, String courseClass) {

        List<SimsAttendNum> list=simsAttendService.selectAttenGroupList(courseCode);

        List<String> xinqi=CourseCheck.checkxinqi2(list);
        model.addAttribute("lists",list);
        model.addAttribute("courseClass",courseClass);
        model.addAttribute("courseCode",courseCode);
        model.addAttribute("xinqi",xinqi);
        return "teacher/sirHomePage";
    }

    @PostMapping(value = "/checkbefore.do")
    public String checkbefore(String coursecode, String inputtime,String courseclass,String xinqi,Model model) throws ParseException {

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date s=df.parse(inputtime);
        model.addAttribute("coursecode",coursecode);
        model.addAttribute("attendDate",inputtime);
        model.addAttribute("xinqi",xinqi);
        model.addAttribute("courseclass",courseclass);
        return "teacher/sirViewSign";

    }

    @PostMapping(value = "/checkone.do")
    public String checkone(String coursecode, String inputtime,String courseclass,String xinqi,Model model) throws ParseException {


        QuerySimsAttendencyDetailInfoParam param = new QuerySimsAttendencyDetailInfoParam();
        param.setCourseCode(coursecode);
        param.setAttendDate(inputtime);
        param.setAttendType("出勤");
        List<SimsAttendencyDetailInfo> checkone = simsAttendService.selectCheckAttendanceOneList(param);
        param.setAttendType("迟到");
        List<SimsAttendencyDetailInfo> checkone2 = simsAttendService.selectCheckAttendanceOneList(param);
        param.setAttendType("缺勤");
        List<SimsAttendencyDetailInfo> checkone3 = simsAttendService.selectCheckAttendanceOneList(param);
        param.setAttendType("请假");
        List<SimsAttendencyDetailInfo> checkone4 = simsAttendService.selectCheckAttendanceOneList(param);

        Integer a =checkone.size();Integer b =checkone2.size();Integer c =checkone3.size();Integer d =checkone4.size();
        model.addAttribute("chuqinnum",a);
        model.addAttribute("chidaonum",b);
        model.addAttribute("queqinnum",c);
        model.addAttribute("qinjianum",d);

        HashMap<String,String> chuqin = new HashMap<String,String>();
        HashMap<String,String> chidao = new HashMap<String,String>();
        HashMap<String,String> queqin = new HashMap<String,String>();
        HashMap<String,String> qinjia = new HashMap<String,String>();

        for(SimsAttendencyDetailInfo simsAttendencyDetailInfo:checkone){
            chuqin.put(simsAttendencyDetailInfo.getStudentName(),simsAttendencyDetailInfo.getStudentNo());
        }for(SimsAttendencyDetailInfo simsAttendencyDetailInfo:checkone2){
            chidao.put(simsAttendencyDetailInfo.getStudentName(),simsAttendencyDetailInfo.getStudentNo());
        }for(SimsAttendencyDetailInfo simsAttendencyDetailInfo:checkone3){
            queqin.put(simsAttendencyDetailInfo.getStudentName(),simsAttendencyDetailInfo.getStudentNo());
        }for(SimsAttendencyDetailInfo simsAttendencyDetailInfo:checkone4){
            qinjia.put(simsAttendencyDetailInfo.getStudentName(),simsAttendencyDetailInfo.getStudentNo());
        }

        model.addAttribute("coursecode",coursecode);
        model.addAttribute("attendDate",inputtime);
        model.addAttribute("xinqi",xinqi);
        model.addAttribute("courseclass",courseclass);
        model.addAttribute("chuqins",chuqin);
        model.addAttribute("chidaos",chidao);
        model.addAttribute("queqins",queqin);
        model.addAttribute("qinjias",qinjia);
        return "teacher/sirViewSign";

    }
    @PostMapping(value = "/updatecheck.do")
    public @ResponseBody
    String updatecheck(String oldtype,String attendType, String coursecode, String attendDate, String STUDENTNO){
        simsAttendService.updateCheck(attendType, coursecode, attendDate, STUDENTNO);
        SimsAttendencyRecordSummary s=  simsAttendService.selectAttSummaryByStuNum(STUDENTNO,coursecode);
        String attend= String.valueOf(simsAttendService.selectAttendStudentalltypeList(STUDENTNO,coursecode,"出勤"));
        String LEAVE= String.valueOf(simsAttendService.selectAttendStudentalltypeList(STUDENTNO,coursecode,"缺勤"));
        String LATE= String.valueOf(simsAttendService.selectAttendStudentalltypeList(STUDENTNO,coursecode,"迟到"));
        String AFFAIR= String.valueOf(simsAttendService.selectAttendStudentalltypeList(STUDENTNO,coursecode,"请假"));
        simsAttendService.updateAttSummaryAttend(attend,LEAVE,LATE,AFFAIR,STUDENTNO,coursecode);
        return "";
    }

    @PostMapping(value = "/checkbegin.do")
    public String checkbegin(Model model, String courseclass, String coursecode){
        model.addAttribute("courseclass",courseclass);
        model.addAttribute("coursecode",coursecode);

        return "teacher/sirSignPage";
    }



    @PostMapping(value = "/checklast.do")
    public @ResponseBody
    Integer checklast(String courseCode) throws ParseException {

        Integer s=simsSignService.selectPersoNumberInSignDetailInfo(courseCode, DateUtil.getWebTodayString());
        return s;
    }


    @GetMapping(value = "ceshi.do")
    public String ceshi(){
        return "teacher/sirHomePage";
    }

    @GetMapping(value = "/checkA.do")
    public String checkA(String xkkh){
        Integer num =smisStudentCourseInfoService.selectXkxx(xkkh);

        return "";
    }

    @PostMapping(value = "/jieshu.do")
    public @ResponseBody
    String jieshu(String courseCode) throws ParseException {

        String date2 = DateUtil.getWebTodayString();
        String date3 = DateUtil.getWebTodayString();
        simsSignService.updateSignGenerateInfoStatus("0",courseCode,date2);
        List<SimsStudentCourseInfo> stu=smisStudentCourseInfoService.selectStuCourseInfoList(courseCode);
        List<String>list=new ArrayList<String>();
        List<String>list2=new ArrayList<String>();
        List<String>list3=new ArrayList<String>();
        for(SimsStudentCourseInfo e : stu){
                    list.add(e.getStudentNo());
             }
        List<SimsSignDetailInfo> alreadyStu=simsSignService.selectAlreadyAttenList(courseCode,date2);
        for(SimsSignDetailInfo e : alreadyStu){
            list2.add(e.getStudentNo());
        }
        list.removeAll(list2);
                for(String e : list){
                String id=smisStudentCourseInfoService.queryCourseId();
                String Stuname=smisStudentCourseInfoService.selectStuBynum(e).getUserName();
                simsAttendService.addStuAttendencyDetailInfo(e,Stuname,courseCode,date2,"缺勤","wu","",date3);

                    String sid=smisStudentCourseInfoService.queryStuId();
                    SimsAttendencyRecordSummary stuNum=simsAttendService.selectAttSummaryByStuNum(e,courseCode);
                    if(stuNum==null){
                        simsAttendService.addStuAttendencyRecordSummary(sid,e,Stuname,courseCode,"0","1","0","0");
                    }else{
                        int num=Integer.valueOf(stuNum.getLeave());
                        num+=1;
                        String num1=String.valueOf(num);
                        simsAttendService.updateAttSummaryAttend(stuNum.getAttend(),num1,stuNum.getLate(),stuNum.getAffair(),e,courseCode);
                    }

           }
        return "true";
    }

    @PostMapping(value = "/fangqi.do")
    public @ResponseBody
    String fangqi(String courseCode,HttpServletRequest request) throws ParseException {

        String dateStr = DateUtil.getWebTodayString();
        List<SimsSignDetailInfo> AlreadyAtten=simsSignService.selectAlreadyAttenList(courseCode,dateStr);

        for (SimsSignDetailInfo s:AlreadyAtten){
            SimsAttendencyRecordSummary stuNum=simsAttendService.selectAttSummaryByStuNum(s.getStudentNo(),courseCode);
            int num=Integer.valueOf(stuNum.getAttend());
            num-=1;

            QuerySimsAttendencyRecordSummaryParam param = new QuerySimsAttendencyRecordSummaryParam();
            param.setStudentNo(s.getStudentNo());

            param.setAttend(String.valueOf(num));
            param.setCourseCode(courseCode);

            simsAttendService.updateAttSummaryAttendByParam(param);
         //   updateAttSummaryAttendByParam
         //   simsAttendService.updateAttSummaryAttend(num1,stuNum.getLeave(),stuNum.getLate(),stuNum.getAffair(),s.getStudentNo());
        }

        simsSignService.deleteSignGenerateInfoByStatus("1",courseCode);
        simsSignService.deleteSignDetailInfoByTime(courseCode,dateStr);
        simsAttendService.deleteAttendencyDetailInfoByTime(courseCode,dateStr);
        return "true";
    }

    /*跳转至课程新增页面*/
    @PostMapping(value = "/addCourseBefore")
    public String addclassbefore(String teacherno,Model model){
        model.addAttribute("teacherno",teacherno);
        return "teacher/createCourse";
    }

    /**创建新的课程**/
    @PostMapping(value = "/addCourse")
    public String addCourse(HttpServletRequest request, String teacherno, String coursename, String xuenian, String xueqi, Model model){

        SimsUserInfo teacher = (SimsUserInfo) request.getSession().getAttribute("user");
        String id1=smisStudentCourseInfoService.queryStuId();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1=new Date();
        String date=df.format(date1);
        String suiji=CourseCheck.suijiinvitecode();
        smisTeacherCourseService.addCourseInfo(id1,coursename,teacher.getUserId(),date,"1",suiji,xuenian,xueqi);
        List<SimsClassInfo>list=new ArrayList<SimsClassInfo>();
        model.addAttribute("teacherCourseclass",list);
        model.addAttribute("ID",id1);
        model.addAttribute("teacherno",teacher.getUserId());
        model.addAttribute("courseId",suiji);
        return "teacher/sirClassRoom";
    }


    /*跳转至班级新增页面*/
    @PostMapping(value = "/addClassBefore")
    public String createClassInfo(HttpServletRequest request, Model model, String courseId){
        model.addAttribute("courseId",courseId);
        return "teacher/addClassInfo";
    }


    /**创建班级信息**/
    @PostMapping(value = "/addClassInfo")
    public String addClassRoom(HttpServletRequest request, Model model, String courseClass, String courseId ){


        SimsUserInfo teacher = (SimsUserInfo) request.getSession().getAttribute("user");

        QueryCourseParam param = new QueryCourseParam();
        param.setCourseId(courseId);
        param.setTeacherNo(teacher.getUserId());
        String bianhao=smisStudentCourseInfoService.queryStuId();
        List<SimsCourseInfo> simsCourseInfoList =  smisTeacherCourseService.queryCourseInfoByParam(param);

        if(simsCourseInfoList.size()==1)
        {
            SimsClassInfo simsClassInfo = new SimsClassInfo();
            simsClassInfo.setCourseClass(courseClass);
            simsClassInfo.setCourseId(courseId);
            simsClassInfo.setCourseCode("("+simsCourseInfoList.get(0).getYear()+"-"+simsCourseInfoList.get(0).getTerm()+")"+"-"+courseId+"-"+simsCourseInfoList.get(0).getTeacherNo()+"-"+bianhao);
            simsClassInfo.setCourseName(simsCourseInfoList.get(0).getCourseName());

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date=new Date();
            String s=df.format(date);
            simsClassInfo.setInputTime(s);
            simsClassInfo.setStatus("1");
            simsClassInfo.setInviteCode(Utils.getInvitationCode());
            simsClassInfo.setTeacherNo(teacher.getUserId());
            smisTeacherCourseService.addSimsClassInfo(simsClassInfo);
        }

        List<SimsClassInfo> teacherCourseclass=smisTeacherCourseService.selectTeacherCourseClassList(teacher.getUserId(), courseId);
        model.addAttribute("teacherCourseclass",teacherCourseclass);
        model.addAttribute("courseId",courseId);

        return "teacher/sirClassRoom";
    }

@PostMapping(value = "/signPage")
public String signPage(String signType,String courseClass,String signCode,String courseCode,String validTime,Model model){


    model.addAttribute("courseClass",courseClass);
    model.addAttribute("courseCode",courseCode);
    model.addAttribute("signType",signType);
    model.addAttribute("signCode",signCode.toCharArray());
    model.addAttribute("validTime",validTime);
    model.addAttribute("count",smisStudentCourseInfoService.selectXkxx(courseCode));

    return "teacher/sirSignType";
}

    @PostMapping(value = "/startSign")
    @ResponseBody
    public String startSign(String courseClass,String courseCode,String validTime,String signType,String signAddress){

        Map<String,String> result = new HashMap<String,String>();
        QuerySignGenerateInfoParam querySignGenerateInfoParam = new QuerySignGenerateInfoParam();
        querySignGenerateInfoParam.setSignDate(DateUtil.getWebTodayString());
        querySignGenerateInfoParam.setCourseCode(courseCode);
        List<SimsSignGenerateInfo> list=simsSignService.selectIfSignGenrateInfo(querySignGenerateInfoParam);

        if(list!=null&&list.size()==0)
        {

            String signCode = Utils.getAttendanceCode();
            String currentTime = DateUtil.currentTime("");
            simsSignService.addSign(courseCode,signType,DateUtil.getWebTodayString(),signCode,signAddress,"1", currentTime,validTime,currentTime);

            result.put("signCode",signCode);
            result.put("courseCode",courseCode);
            result.put("signType",signType);
            result.put("changeTimeInteger",validTime);
            result.put("validTime",validTime);
            result.put("courseClass",courseClass);

            return JsonUtils.toJson(result);

        }
        else
        {
            return "error";
        }

    }


    @PostMapping(value = "/classallper.do")
    public String classallper(String coursecode,Model model){
        List<SimsStudentNameNum>courseinfos=smisStudentCourseInfoService.selectStudentNumName(coursecode);
        String  s=smisTeacherCourseService.selectCourseNameByCode(coursecode).getCourseClass();
        model.addAttribute("courseClass",s);
        model.addAttribute("courseinfos",courseinfos);
        return "teacher/sirClassPeople";
    }

    @PostMapping(value = "/deleteClassOne.do")
    @ResponseBody
    public  String deleteClassOne(String coursecode) throws ParseException {
        Date date=new Date();
        String inputtime=smisTeacherCourseService.selectCourseNameByCode(coursecode).getInputTime();
        Integer hours=CourseCheck.deleteBytime(date,inputtime);
        if(hours<=1){
            smisStudentCourseInfoService.deleteStudentCourseInfo(coursecode);
            smisTeacherCourseService.deleteClassInfo(coursecode);
            return "true";
        }else{
            return "false";
        }

    }

    @PostMapping(value = "/deleteCourseOne.do")
    public @ResponseBody
    String deleteCourseOne(String courseid) throws ParseException {
        Date date=new Date();
        String inputtime=smisTeacherCourseService.selectCourseInfoByCourseid(courseid).getInputTime();
        Integer hours=CourseCheck.deleteBytime(date,inputtime);
        if(hours<=1){
            smisTeacherCourseService.deleteCourseInfo(courseid);
            smisTeacherCourseService.deleteClassInfoMost(courseid);
            return "true";
        }else{
            return "false";
        }

    }

    @PostMapping(value = "/updateCouesebian.do")
    public @ResponseBody
    String updateCouese(String coursename,String courseid){
        smisTeacherCourseService.updateCourse(coursename,courseid);
        return "true";
    }
    @PostMapping(value = "/updateClassbian.do")
    public @ResponseBody
    String updateClass(String courseclass,String coursecode){
       smisTeacherCourseService.updateClassbian(courseclass,coursecode);
        return "true";
    }

    @PostMapping(value = "/deletelishi.do")
    public @ResponseBody
    String deletelishi(String coursecode,String date) throws ParseException {
        simsSignService.deleteSignGenerateInfoByStatuslishi("0",coursecode,date);
        simsSignService.deleteSignDetailInfoByTime(coursecode,date);
        simsAttendService.deleteAttendencyDetailInfoByTime(coursecode,DateUtil.getWebTodayString());
        List<SimsStudentCourseInfo>s=smisStudentCourseInfoService.selectStuCourseInfoList(coursecode);
        for(SimsStudentCourseInfo list: s){
            String attend= String.valueOf(simsAttendService.selectAttendStudentalltypeList(list.getStudentNo(),coursecode,"出勤"));
            String LEAVE= String.valueOf(simsAttendService.selectAttendStudentalltypeList(list.getStudentNo(),coursecode,"缺勤"));
            String LATE= String.valueOf(simsAttendService.selectAttendStudentalltypeList(list.getStudentNo(),coursecode,"迟到"));
            String AFFAIR= String.valueOf(simsAttendService.selectAttendStudentalltypeList(list.getStudentNo(),coursecode,"请假"));
            simsAttendService.updateAttSummaryAttend(attend,LEAVE,LATE,AFFAIR,list.getStudentNo(),coursecode);

        }
        return "true";
    }

    @PostMapping(value = "/ckhz.do")
    public String ckhz(String courseCode,Model model,String courseClass){
        List<SimsAttendNumEveryStu> simsAttendNumEveryStus=simsAttendService.selectAttendGroupEveryStuList(courseCode);
        model.addAttribute("simsAttendNumEveryStus",simsAttendNumEveryStus);
        model.addAttribute("courseClass",courseClass);
        return "teacher/sirClassList";
    }

    /*形式与政策*/

    @PostMapping(value ="/checkCourseclassallxingshi.do")
    public String checkCourseclassallxingshi(Model model,HttpServletRequest request,String courseId){
        SimsUserInfo teacher = (SimsUserInfo) request.getSession().getAttribute("user");
        List<SimsClassInfo>simsClassInfos= smisTeacherCourseService.selectTeacherCourseClassList(teacher.getUserId(),courseId);
        if(simsClassInfos.size()==1){
            List<SimsAttendNum> list=simsAttendService.selectAttenGroupList(simsClassInfos.get(0).getCourseCode());

            List<String> xinqi=CourseCheck.checkxinqi2(list);
            model.addAttribute("lists",list);
            model.addAttribute("courseClass",simsClassInfos.get(0).getCourseClass());
            model.addAttribute("courseCode",simsClassInfos.get(0).getCourseCode());
            model.addAttribute("xinqi",xinqi);

        }
        return  "teacher/sirHomePage";
    }
    @PostMapping(value = "jieshuxingshi.do")
    public @ResponseBody
    String jieshuxingshi(String courseCode){
        String date2 = DateUtil.getWebTodayString();
        simsSignService.updateSignGenerateInfoStatus("0",courseCode,date2);
        return "true";
    }


    /*形式与政策*/

}
