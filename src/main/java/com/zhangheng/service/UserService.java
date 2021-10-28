package com.zhangheng.service;

import com.zhangheng.po.User;

public interface UserService {
    boolean addUser(User user) throws Exception;
    User findUserById(String phonenum) throws Exception;
    User findUserById(Integer id);//根据id查询用户
}
