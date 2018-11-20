package com.eva.classsystem.controller;

import com.alibaba.fastjson.JSONObject;
import com.eva.classsystem.pojo.*;
import com.eva.classsystem.pojo.weChatPojo.AccessReqPOJO;
import com.eva.classsystem.service.SimsUserService;
import com.eva.classsystem.service.SmisStudentCourseInfoService;
import com.eva.classsystem.service.SmisTeacherCourseService;
import com.eva.classsystem.utils.*;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: Jiang Jiahong
 * @Description: 微信公众号 验证
 * @Date: 2018/2/5 15:53
 */
@Controller
@RequestMapping("/wechat")
public class WeChatController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SimsUserService simsUserService;
    @Autowired
    private SmisTeacherCourseService smisTeacherCourseService;

    @Autowired
    private SmisStudentCourseInfoService smisStudentCourseInfoService;
    /**
     * @Author: Jiang Jiahong
     * @Description: 微信端服务器验证 连接微信
     * @Date: 2018/2/5 17:12
     */
    @GetMapping(value = "/checkSignature")
    public @ResponseBody String checkSignature(HttpServletRequest request ) throws IOException {
        //2.初始化菜单
        String menu = JSONObject.toJSONString(WeChatUtils.getMenu()).toString();
        int result = WeChatUtils.createMenu(TokenThread.accessTokenPOJO.getAccess_token(), menu);
        if(result == 0){
            System.out.println("菜单创建成功");
        }else{
            System.out.println("菜单创建失败");
        }

        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        AccessReqPOJO accessReqPOJO = new AccessReqPOJO();
        accessReqPOJO.setEchostr(echostr);
        accessReqPOJO.setNonce(nonce);
        accessReqPOJO.setSignature(signature);
        accessReqPOJO.setTimestamp(timestamp);

        //校验
        if( CheckAccessUtils.checkSignatrue( accessReqPOJO ) ){
            return accessReqPOJO.getEchostr();
        }
        return "error";
    }

    //接收文本信息POST并回复
    @PostMapping(value = "/checkSignature")
    public @ResponseBody String testMessage( HttpServletRequest request ){
        //1.获得用户发送的文字，把xml解析成Map
        Map< String,String > textMap = MessageUtils.xmlToTextMessage( request );
        //2.获得相应字段
        String msgType = textMap.get("MsgType");
        String content = textMap.get("Content");
        String createTime = textMap.get("CreateTime");
        String toUserName = textMap.get("ToUserName");
        String fromUserName = textMap.get("FromUserName");
        String msgId = textMap.get("MsgId");
        //3.判断消息类型
        String result = null;
        if (MessageUtils.MESSAGE_EVENT.equals(msgType) ){
            //事件类型中有  关注事件 与 取消关注事件
            String event = textMap.get("Event");
            //4.用户关注事件
            if( MessageUtils.MESSAGE_SUBSCRIBE.equals(event) ){
                result = MessageUtils.intiText(toUserName, fromUserName, MessageUtils.subscribeText());
            }
        }
        return result;
    }


    /**
     * 拼接网页授权链接
     * 此处步骤也可以用页面链接代替
     * @return
     */
    @RequestMapping(value = { "/oauth2wx" })
    public String Oauth2API(HttpServletRequest request){
        //获取项目域名
        String requestUrl = request.getServerName();
        String contextPath = request.getContextPath();
        logger.info("domain name: " + requestUrl + " project name: " + contextPath);
        //拼接微信回调地址
       // String backUrl ="http://" + requestUrl + contextPath + "/weixinLogin";
        String backUrl = "http://weixin.tunnel.qydev.com/wechat/weixinLogin";
        String redirect_uri = "";
        try {
            redirect_uri = java.net.URLEncoder.encode(backUrl, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error("ecdoe error: " + e.getMessage());
        }
        String oauth2Url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + "wx37444b703da28035" + "&redirect_uri=" + redirect_uri
                + "&response_type=code&scope=snsapi_privateinfo&agentid="+"1000015"+"&state=STATE&connect_redirect=1#wechat_redirect";
        return "redirect:" + oauth2Url;
    }

    @RequestMapping(value = "/weixinLogin",method = {RequestMethod.POST, RequestMethod.GET})
    @ApiOperation(value="用户第三方登录", notes="企业微信授权登录")
    public String thridPartloginWeixin(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception{

        String code = request.getParameter("code");
        String state =request.getParameter("state");
        logger.error("*********************1***********************");
        logger.error("企业微信测试—程1：code="+code+"state="+state);
        logger.error("************************************************");
        //获取公司凭证

        String access_token= TokenThread.accessTokenPOJO.getAccess_token();
        logger.error("********************2*************************");
        logger.error("企业微信测试—程2：access_token="+access_token);
        logger.error("************************************************");

        //获取用户凭证
        String user_ticket =  WeChatUtils.getUserInfo(access_token,code);
        logger.error("********************3**************************");
        logger.error("企业微信测试—程3：user_ticket="+user_ticket);
        logger.error("************************************************");

        //获取用户信息  用post请求
        String email =    WeChatUtils.getUserDetailInfo(access_token,user_ticket);

        logger.error("********************4**************************");
        logger.error("企业微信测试—程4：最后="+email);
        logger.error("************************************************");

        String userNumber= StringUtils.substring(email,0,10);

        logger.info("用户工号："+userNumber);
        //判断用户权限
        SimsUserInfo simsUserInfo = simsUserService.checkUser(userNumber);

        if(simsUserInfo==null)
        {
            return "login";
        }

        if(simsUserInfo.getRoleName().equalsIgnoreCase("teacher"))
        {
            request.getSession().setAttribute("user", simsUserInfo);
            request.getSession().setAttribute("userRole", RoleUtills.TEACHER);
            List<SimsCourseInfo> simsCourseInfoList = smisTeacherCourseService.selectTeacherCourseList(userNumber);
            model.addAttribute("courseList",simsCourseInfoList);
            model.addAttribute("teacherno",userNumber);
      //      return"forward:getUserCoursePage";

           // return "redirect:/WEB-INF/templates/teacher/sirCourse.jsp";


           //return "redirect:teacher/sirCourse.jsp";

          //  return "    return \"forward:/index.action\";"
           // return "forward:/getUserCoursePage";

            return "redirect:/getUserCoursePage";

      //      return "teacher/sirCourse";

        }
        else
        {
            request.getSession().setAttribute("user", simsUserInfo);
            request.getSession().setAttribute("userRole", RoleUtills.STUDENT);

            List<SimsStudentCourseInfo> studentCourseInfoList=smisStudentCourseInfoService.selectCoursecodeByStuNoList(userNumber);
            List<SimsClassInfo> simsClassInfoList = new ArrayList<SimsClassInfo>();
            for(SimsStudentCourseInfo list : studentCourseInfoList) {
                SimsClassInfo s= smisTeacherCourseService.selectCourseNameByCode(list.getCourseCode());
                simsClassInfoList.add(s);
            }
            model.addAttribute("stuclassall",simsClassInfoList);
            return "student/stuClass";

        }
    }



    @RequestMapping(value = { "/getJsTicket" })
    @ResponseBody
    public Map<String, String> getWeJsTicket(HttpServletRequest request, String url){

        String jsApi_ticket = WeChatUtils.getJsApiTicket(TokenThread.accessTokenPOJO.getAccess_token());
        return  WeChatUtils.signature(jsApi_ticket,url);
    }

}
