package com.zhangheng.service;

import com.zhangheng.po.Article;

import java.util.List;


public interface ArticleService {
    boolean addArticle(Article article);
    List<Article> findArticleAll();
    Article findArticleById(Integer id);//根据id查询文章
    List<Article> findArticleByAuthorId(Integer authorId);//根据作者id查询文章
    boolean addOneNum(Integer id);//使文章阅读数+1
    boolean updateArticleById(Article article);//根据文章id修改文章
    boolean deleteArticleById(Integer id);//根据文章id删除文章
}
