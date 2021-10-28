package com.zhangheng.po;
/*文章实体类*/
public class Article {
    private Integer id;
    private String title;//文章标题
    private String author;//作者用户名
    private Integer authorId;//作者id
    private String time;//发布时间
    private Integer num;//阅读次数
    private String state;//文章状态;
    private String introduce;//简介
    private String content;//内容

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", authorId=" + authorId +
                ", time='" + time + '\'' +
                ", num=" + num +
                ", state='" + state + '\'' +
                ", introduce='" + introduce + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
