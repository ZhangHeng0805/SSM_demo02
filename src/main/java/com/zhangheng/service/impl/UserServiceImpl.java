package com.zhangheng.service.impl;

import com.zhangheng.dao.UserDao;
import com.zhangheng.po.User;
import com.zhangheng.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public boolean addUser(User user) throws Exception{
        /*int b = userDao.addUser(user.getUsername(),user.getSex(), user.getPhonenum(),
                user.getPassword(), user.getIntroduction(),user.getRegistrationTime(),user.getModifyTime());*/
        int b=userDao.addUser(user);
        if (b > 0) {
//            System.out.println("User添加成功！"+b);
            return true;
        } else {
//            System.out.println("User添加失败！"+b);
            return false;
        }
    }

    @Override
    public User findUserById(@Param("phonenum") String phonenum) throws Exception{
        User userByPhonenum = userDao.findUserByPhonenum(phonenum);
        return userByPhonenum;
    }

    @Override
    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }
}
