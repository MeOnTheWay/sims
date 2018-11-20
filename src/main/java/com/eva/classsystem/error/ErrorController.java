package com.eva.classsystem.error;

import com.eva.classsystem.pojo.SimsClassInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <pre>
 * 出错页面控制器
 * Created by Binary Wang on 2018/8/25.
 * </pre>
 *
 * @author <a href="https://github.com/binarywang">Binary Wang</a>
 */
@Controller
@RequestMapping("/error")
public class ErrorController {

  @GetMapping(value = "/404")
  public String error404(Model model) {
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date=df.format(new Date());
    model.addAttribute("timestamp",date);
    model.addAttribute("error", "error");
    model.addAttribute("status", "error");
    model.addAttribute("message", "error");
    return "error";
  }

  @GetMapping(value = "/500")
  public String error500(Model model) {
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date=df.format(new Date());
    model.addAttribute("timestamp",date);
    model.addAttribute("error", "error");
    model.addAttribute("status", "error");
    model.addAttribute("message", "error");
    return "error";
  }

}
