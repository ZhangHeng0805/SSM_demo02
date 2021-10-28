package com.zhangheng.springmvc;

import com.zhangheng.util.Message;
import com.zhangheng.util.TimeUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class LoginInterceptor  implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //登录检查
        HttpSession session =httpServletRequest.getSession();
//        String requestURI = request.getRequestURI();
//        log.info("拦截的请求路径是{}",requestURI);
        Object loginUser = session.getAttribute("user");
        if (loginUser!=null){
            //放行
            return true;
        }
        Message msg = new Message();
        msg.setTime(TimeUtil.time(new Date()));
        msg.setCode(500);
        msg.setTitle("未登录");
        msg.setMessage("请先登录");
        httpServletRequest.setAttribute("msg",msg);
        httpServletRequest.getRequestDispatcher("/").forward(httpServletRequest,httpServletResponse);
        //拦截
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
