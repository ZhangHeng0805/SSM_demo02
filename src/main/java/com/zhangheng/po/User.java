package com.zhangheng.po;

/*用户账号信息*/
public class User {
    private Integer id;
    private String username;//用户名
    private String sex;//性别
    private String phonenum;//账号（手机号）
    private String password;//密码
    private String introduction;//个人介绍
    private String registrationTime;//注册时间
    private String modifyTime;//修改时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(String registrationTime) {
        this.registrationTime = registrationTime;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", sex='" + sex + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", password='" + password + '\'' +
                ", introduction='" + introduction + '\'' +
                ", registrationTime='" + registrationTime + '\'' +
                ", modifyTime='" + modifyTime + '\'' +
                '}';
    }
}
