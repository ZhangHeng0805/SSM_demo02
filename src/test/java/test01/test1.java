package test01;

import com.zhangheng.po.User;
import com.zhangheng.service.UserService;
import com.zhangheng.util.TimeUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class test1 {
    @Autowired
    private UserService userService;
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
