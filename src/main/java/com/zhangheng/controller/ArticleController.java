package com.zhangheng.controller;

import com.sun.istack.internal.Nullable;
import com.zhangheng.po.Article;
import com.zhangheng.po.User;
import com.zhangheng.service.ArticleService;
import com.zhangheng.util.Message;
import com.zhangheng.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    /*跳转至添加文章页面*/
    @GetMapping("addArticle")
    private String addWeb(){
        return "addArticle";
    }
    /*添加文章表单提交*/
    @PostMapping("addArticle")
    public String addArticle(Article article, Model model, HttpServletRequest request){
        Message msg=new Message();
     /*   msg.setTime(TimeUtil.time(new Date()));
        msg.setCode(100);
        msg.setTitle("测试");
        msg.setMessage(article.toString());*/
        if (article!=null){
            User user = (User) request.getSession().getAttribute("user");
            //判段作者信息是否更改
            if (article.getAuthor().equals(user.getUsername())&&article.getAuthorId().equals(user.getId())){
                //判断输入的内容文字是否超过限制
                if (article.getTitle().length()<=50&&article.getIntroduce().length()<=100&&article.getContent().length()<=20000) {
                    article.setTime(TimeUtil.time(new Date()));//添加时间
                    article.setNum(0);//添加阅读次数
                    boolean b = articleService.addArticle(article);
                    if (b) {//数据库是否添加成功
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(200);
                        msg.setTitle("成功");
                        msg.setMessage("《" + article.getTitle() + "》发布成功！<a href=\"/main\">去首页</a>");
                    } else {
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(500);
                        msg.setTitle("失败");
                        msg.setMessage("《" + article.getTitle() + "》，发布失败，请重试");
                    }
                }else {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(500);
                    msg.setTitle("错误");
                    msg.setMessage("发布失败，输入内容超过字数限制！");
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("错误");
                msg.setMessage("作者信息错误！请刷新网页重试。");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("null");
            msg.setMessage("article为空");
        }
        System.out.println(msg.toString());
        model.addAttribute("msg",msg);
        return "addArticle";
    }
    /*跳转至阅读文章界面，查看文章内容*/
    @RequestMapping("ReadArticle/{id}/{title}")
    public String readArticle(@PathVariable("id") Integer id,@PathVariable("title") String title, Model model,HttpServletRequest request){
        Message msg=new Message();
        if (id!=null&&title!=null) {
            Article articleById = articleService.findArticleById(id);
            if (title.equals(articleById.getTitle())) {
                //判断查看的文章是否公开
                if (articleById.getState().equals("公开")) {
                    articleService.addOneNum(id);//阅读量+1
                    model.addAttribute("article", articleById);
                }else {
                    User user = (User) request.getSession().getAttribute("user");
                    //判断用户是否登录
                    if (user!=null) {
                        //判断私密文章是否是本人查看
                        if (articleById.getAuthorId().equals(user.getId())) {
                            articleService.addOneNum(id);//阅读量+1
                            model.addAttribute("article", articleById);
                        } else {
                            msg.setTime(TimeUtil.time(new Date()));
                            msg.setCode(500);
                            msg.setTitle("无权查看");
                            msg.setMessage("您无权查看此文章！");
                        }
                    }else {
                        msg.setTime(TimeUtil.time(new Date()));
                        msg.setCode(500);
                        msg.setTitle("请登录");
                        msg.setMessage("请登录后再来查看！<a href=\"/\">去登录</a>");
                    }
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("url错误");
                msg.setMessage("查看url地址错误！");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("null");
            msg.setMessage("查看url地址为空");
        }
        return "readArticle";
    }
    /*跳转至我的文章界面*/
    @RequestMapping("myArticlePage/{id}/{username}")
    public String myWeb(@PathVariable("id") Integer id,@PathVariable("username")String username,Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Message msg = new Message();
        if (id!=null&&username!=null) {
            //验证id和用户名是否属于本人
            if (user.getUsername().equals(username)&&user.getId().equals(id)) {
                List<Article> articleByAuthorId = articleService.findArticleByAuthorId(id);
                //判断我是否发表过文章
                if (!articleByAuthorId.isEmpty()) {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(200);
                    msg.setTitle("我的文章");
                    msg.setMessage(username + "，你一共有" + articleByAuthorId.size() + "个文章!");
                    model.addAttribute("articleByAuthorId", articleByAuthorId);
                } else {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(500);
                    msg.setTitle("没有文章");
                    msg.setMessage("对不起，你暂时没有文章。");
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("错误");
                msg.setMessage("账号信息错误！请退出重试。");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("我的文章null");
            msg.setMessage("id和username为空");
        }
        System.out.println(msg.toString());
        model.addAttribute("msg",msg);
        return "myArticle";
    }
    /*跳转至修改文章界面*/
    @PostMapping("modifyArticlePage")
    public String modifyWeb(Integer id,Integer authorId,Model model,HttpServletRequest request){
        Message msg=new Message();
        if (id!=null&&authorId!=null){
            User user = (User) request.getSession().getAttribute("user");
            //判断修改的文章是否属于本人
            if (user.getId().equals(authorId)) {
                Article articleById = articleService.findArticleById(id);
                if (articleById != null) {
                    model.addAttribute("article",articleById);
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(200);
                    msg.setTitle("文章修改成功");
                    msg.setMessage("文章《"+articleById.getTitle()+"》修改...");
                } else {
                    msg.setTime(TimeUtil.time(new Date()));
                    msg.setCode(500);
                    msg.setTitle("文章id错误");
                    msg.setMessage("没有找到需要修改的id");
                }
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("修改文章非本人");
                msg.setMessage("对不起，你没有权限修改他人的文章！");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("id和authorId为null");
            msg.setMessage("修改文章id或作者id为null");
        }
        System.out.println(msg.toString());
        model.addAttribute("msg",msg);
        return "modifyArticle";
    }
    /*修改文章表单提交*/
    @PostMapping("modifyArticle")
    public String modifyArticle(Article article,Model model){
        Message msg=new Message();
        if (article!=null){
//            System.out.println(article);
            article.setTime(TimeUtil.time(new Date()));
            boolean b = articleService.updateArticleById(article);
            if (b){
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(200);
                msg.setTitle("修改成功");
                msg.setMessage("文章修改成功!,<a href=\"/main\">返回首页</a>");
            }else {
                msg.setTime(TimeUtil.time(new Date()));
                msg.setCode(500);
                msg.setTitle("修改失败");
                msg.setMessage("修改文章失败!");
            }
        }else {
            msg.setTime(TimeUtil.time(new Date()));
            msg.setCode(500);
            msg.setTitle("article为null");
            msg.setMessage("修改文章iarticle为null");
        }
        System.out.println(msg.toString());
        model.addAttribute("msg",msg);
        return "modifyArticle";
    }

}
