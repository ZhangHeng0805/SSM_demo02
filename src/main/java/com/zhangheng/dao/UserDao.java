package com.zhangheng.dao;

import com.zhangheng.po.User;
import org.apache.ibatis.annotations.Param;

/*User的接口文件*/
public interface UserDao {
    int addUser(User user);//添加用户
    User findUserByPhonenum(String phonenum);//根据手机号查询用户
    User findUserById(Integer id);//根据id查询用户
}
