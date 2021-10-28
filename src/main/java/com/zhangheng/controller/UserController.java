package com.zhangheng.controller;

import com.zhangheng.po.Article;
import com.zhangheng.po.User;
import com.zhangheng.service.ArticleService;
import com.zhangheng.service.UserService;
import com.zhangheng.util.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*用户控制器*/
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    /*页面跳转至注册页面*/
    @RequestMapping("registration")
    public String Regitration(Model model){
//        System.out.println("页面跳转至注册页面");
        Message msg = new Message();
        msg.setCode(200);
        msg.setTitle("欢迎");
        msg.setMessage("欢迎您加入我们！");
        model.addAttribute("msg",msg);
        return "registration";
    }
    /*注册页面表单提交*/
    @RequestMapping("registrationForm")
    public String userRegitration(User user, Model model) throws Exception {
//        System.out.println("注册页面表单提交");
        Message msg = new Message();
        if (user!=null){
//            System.out.println(user.toString());
            if (PhoneNumUtil.isMobile(user.getPhonenum())) {
                User userById = userService.findUserById(user.getPhonenum());//根据号码查询数据库
                if (userById == null) {
                    user.setIntroduction(HTMLUtil.delHTMLTag(user.getIntroduction()));//防止注入攻击
                    user.setUsername(HTMLUtil.delHTMLTag(user.getUsername()));//防止注入攻击
                    user.setRegistrationTime(TimeUtil.time(new Date()));
                    user.setModifyTime(TimeUtil.time(new Date()));
                    boolean b = userService.addUser(user);
                    if (b) {
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(200);
                        msg.setTitle("成功");
                        msg.setMessage("恭喜" + user.getUsername() + "，注册成功！");
                    }else {
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(500);
                        msg.setTitle("失败");
                        msg.setMessage("对不起，注册失败！");
                    }
                } else {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(500);
                    msg.setTitle("重复:" + user.getPhonenum());
                    msg.setMessage("该电话号码已被注册，请勿重复注册！");
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("错误:"+user.getPhonenum());
                msg.setMessage("注册失败，请输入正确的电话号码");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("null");
            msg.setMessage("注册失败，User为null");
        }

        System.out.println(msg.toString());
        model.addAttribute("msg",msg);
        return "registration";
    }

    /*登录页面跳转*/
    @RequestMapping("/")
    public String index(HttpServletRequest request){
        String ipAddress = CusAccessObjectUtil.getIpAddress(request);
        String user_agent = CusAccessObjectUtil.getUser_Agent(request);
        System.out.println(TimeUtil.time(new Date())+" ："+ipAddress);
        System.out.println(TimeUtil.time(new Date())+" ："+user_agent);
//        System.out.println("首页");
        return "login";
    }
    /*登录表单提交*/
    @PostMapping("index")
    public String login(User user, Model model, HttpSession session) throws Exception {
        Message msg = new Message();
        if (user!=null){
//            System.out.println(user.toString());
            if (PhoneNumUtil.isMobile(user.getPhonenum())) {
                User userById = userService.findUserById(user.getPhonenum());//根据号码查询数据库
                if (userById != null) {
//                    System.out.println(userById.toString());
                    if (user.getPassword().equals(userById.getPassword())){
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(200);
                        msg.setTitle("成功:"+user.getPhonenum());
                        msg.setMessage("欢迎："+userById.getUsername()+",登录成功");
                        model.addAttribute("msg",msg);
                        System.out.println(msg.toString());
                        session.setAttribute("user",userById);
                        return "redirect:main";//登陆成功,重定向到登录页面
                    }else {
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(500);
                        msg.setTitle("错误:"+user.getPhonenum());
                        msg.setMessage("密码错误，请输入正确的密码");
                        model.addAttribute("msg",msg);
                        System.out.println(msg.toString());
                        return "login";
                    }
                }else {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(500);
                    msg.setTitle("错误:"+user.getPhonenum());
                    msg.setMessage("没有此用户，请输入正确的电话号码");
                    model.addAttribute("msg",msg);
                    System.out.println(msg.toString());
                    return "login";
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("错误:"+user.getPhonenum());
                msg.setMessage("登录失败，请输入正确的电话号码");
                model.addAttribute("msg",msg);
                System.out.println(msg.toString());
                return "login";
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("错误");
            msg.setMessage("登录失败，User为null");
            model.addAttribute("msg",msg);
            System.out.println(msg.toString());
            return "login";
        }

    }
    /*跳转至主页*/
    @GetMapping("main")
    public String main(Model model, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        User userById = userService.findUserById(user.getPhonenum());
        model.addAttribute("user",userById);//用户信息

        List<Article> articleAll = articleService.findArticleAll();
        List<Article> publicArticleLis=new ArrayList<>();//公开状态的文章
//        List<Article> privateArticleLis=new ArrayList<>();//私密状态的文章
        int myArticleNum=0;//我的全部类型文章数
        int myPublicArticleNum=0;//我的全部公开类型文章数
        for (Article a:articleAll){
//            System.out.println(a.toString());
            if (a.getAuthorId().equals(user.getId())){//判断自己的作品
                myArticleNum++;
                switch (a.getState()){
                    case "公开":
                        myPublicArticleNum++;
                        break;
                    case "私密":
                        break;
                    default:
                        break;
                }

            }
            switch (a.getState()){
                case "公开":
                    publicArticleLis.add(a);
                    break;
                case "私密":
//                    privateArticleLis.add(a);
                    break;
                    default:
                        break;
            }
        }
//        System.out.println(articleAll.size());
        model.addAttribute("articleAll",articleAll);//全部类型文章信息
        model.addAttribute("publicArticleLis",publicArticleLis);//全部公开文章信息
        model.addAttribute("myArticleNum",myArticleNum);//我的全部文章数量
        model.addAttribute("myPublicArticleNum",myPublicArticleNum);//我的全部公开类型文章数量
        return "index";
    }
    /*注销退出*/
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        Message msg = new Message();
        msg.setTime(TimeUtil.time(new Date()));
        msg.setCode(200);
        msg.setTitle("退出:"+user.getPhonenum());
        msg.setMessage("用户："+user.getUsername()+"，注销登录！");
        System.out.println(msg.toString());
        ClearSession.clear(request);
        return "redirect:/";
    }


    @Test
    public void addUser() throws Exception {
        User user = new User();
        user.setUsername("星曦向荣");
        user.setSex("男");
        user.setPhonenum("13733430842");
        user.setPassword("10120812");
        user.setIntroduction("我是张恒");
        user.setRegistrationTime(TimeUtil.time(new Date()));
        user.setModifyTime(TimeUtil.time(new Date()));
        boolean b = userService.addUser(user);
        System.out.println(b);
    }
}
