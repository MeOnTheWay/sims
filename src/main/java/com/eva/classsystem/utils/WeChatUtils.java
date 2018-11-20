package com.eva.classsystem.utils;

import com.alibaba.fastjson.JSONObject;

import com.eva.classsystem.pojo.weChatPojo.*;
import io.swagger.annotations.ApiOperation;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * @Author: Jiang Jiahong
 * @Description: 获得微信ACCESS_TOKEN ，调用接口
 * @Date: 2018/2/6 11:07
 */
public class WeChatUtils {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final static String CHARSET = "UTF-8";

/*    private final static String APPID = "wx37444b703da28035";
    private final static String APPSECRET = "xDCd5L309kJRcPox8KdY4ygBhTH43bjv16UZlF69VgI";*/

    /**
     * 企业Id
     */
    public final static String CORPID = "wx37444b703da28035";

    /**
     * secret管理组的凭证密钥
     */
    private final static String CORPSECRET = "xDCd5L309kJRcPox8KdY4ygBhTH43bjv16UZlF69VgI";



   // private final static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    private final static String ACCESS_TOKEN_URL ="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=CORPID&corpsecret=CORPSECRET";

    private final static String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

    //GET 方法
    public static JSONObject doGetStr(String url) {
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        HttpGet httpGet = new HttpGet(url);
        JSONObject jsonObject = getJsonObject(httpClientBuilder, httpGet);
        return jsonObject;
    }

    //POST 方法
    public static JSONObject doPostStr(String url, String str) {
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(new StringEntity(str, CHARSET));
        JSONObject jsonObject = getJsonObject(httpClientBuilder, httpPost);
        return jsonObject;
    }
    /**
     * @Author: Jiang Jiahong
     * @Description: 得到由 get / post返回的json
     * @Date: 2018/2/6 13:56
     */
    public static JSONObject getJsonObject(HttpClientBuilder httpClientBuilder, HttpUriRequest request) {
        JSONObject jsonObject = null;
        try {
            HttpResponse httpResponse = httpClientBuilder.build().execute(request);
            HttpEntity httpEntity = httpResponse.getEntity();
            if (null != httpEntity) {
                String result = EntityUtils.toString(httpEntity, CHARSET);
                jsonObject = JSONObject.parseObject(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    //获取 token方法
    //注意： 获取的时候先找本地文件里存的token，如果时间超过7200秒就重新获取，这个方法可以避免多次刷新产生冲突
    //使用线程
    public static AccessTokenPOJO getAccessToken() {
        AccessTokenPOJO accessTokenPOJO = new AccessTokenPOJO();
        String url = ACCESS_TOKEN_URL.replace("CORPID", CORPID).replace("CORPSECRET", CORPSECRET);
        JSONObject jsonObject = null;
        try {
            jsonObject = doGetStr(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (null != jsonObject) {
            accessTokenPOJO.setAccess_token(jsonObject.getString("access_token"));
            accessTokenPOJO.setExpires_in(jsonObject.getString("expires_in"));
        }
        return accessTokenPOJO;
    }


    //组装菜单
    public static MenuPOJO getMenu() {
        //ViewButton 入口
        ViewButtonPOJO viewButtonPOJO = new ViewButtonPOJO();
        viewButtonPOJO.setName("进入课堂");
        viewButtonPOJO.setType("view");
        viewButtonPOJO.setUrl("http://miffy.free.ngrok.cc/home");

        //ViewButton 帮助手册
        ViewButtonPOJO viewButtonSir = new ViewButtonPOJO();
        viewButtonSir.setName("老师手册");
        viewButtonSir.setType("view");
        viewButtonSir.setUrl("http://miffy.free.ngrok.cc/sirManual.html");

        ViewButtonPOJO viewButtonStu = new ViewButtonPOJO();
        viewButtonStu.setName("学生手册");
        viewButtonStu.setType("view");
        viewButtonStu.setUrl("http://miffy.free.ngrok.cc/stuManual.html");

        ButtonPOJO button = new ButtonPOJO();
        button.setName("帮助中心");
        button.setSub_button(new ButtonPOJO[]{viewButtonSir, viewButtonStu});

        //拼接主菜单
        MenuPOJO menu = new MenuPOJO();
        menu.setButtonPOJO(new ButtonPOJO[]{viewButtonPOJO, button});

        return menu;
    }

    //创建菜单
    public static int createMenu(String token, String menu) {
        int result = 0;
        String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", token);
        JSONObject jsonObject = doPostStr(url, menu);
        if (jsonObject != null) {
            result = jsonObject.getIntValue("errcode");
        }
        return result;
    }


    public static String  getUserInfo(String token,String code)
    {

        String urlstr = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token="+token+"&code="+code;
        String user_ticket="";
        //获取用户凭证
        JSONObject jsonObject = doGetStr(urlstr);
        if (jsonObject != null) {
            user_ticket = jsonObject.getString("user_ticket");
        }
        return user_ticket;
    }



    public static String getUserDetailInfo(String token,String user_ticket)
    {

        JSONObject obj = new JSONObject();
        obj.put("user_ticket",user_ticket);
        String result="";
        //获取用户详细信息
        JSONObject jsonObject =doPostStr("https://qyapi.weixin.qq.com/cgi-bin/user/getuserdetail?access_token="+token,obj.toString());

        if (jsonObject != null) {
            result = jsonObject.getString("email");
        }
        return result;
    }

    //获取UUID
    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    //获取时间戳
    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }

    public static String getJsApiTicket(String token)
    {
        String urlstr = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token="+token;
        String jsApi_ticket="";
        //获取用户凭证
        JSONObject jsonObject = doGetStr(urlstr);
        if (jsonObject != null) {
            jsApi_ticket = jsonObject.getString("ticket");
        }
        return jsApi_ticket;

    }

    public static Map<String, String> signature(String jsapi_ticket, String url) {
        Map<String, String> ret = new HashMap<String, String>();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                "&noncestr=" + nonce_str +
                "&timestamp=" + timestamp +
                "&url=" + url;
        System.out.println(string1);

        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        System.out.println(signature);


        ret.put("url", url);
        ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        ret.put("corpId",CORPID);

        return ret;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

}
