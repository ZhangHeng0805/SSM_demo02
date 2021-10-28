package com.zhangheng.dao;

import com.zhangheng.po.Article;

import java.util.List;

public interface ArticleDao {
    int addArticle(Article article);//添加文章

    List<Article> findArticleAll();//查询全部文章
    Article findArticleById(Integer id);//根据id查询文章
    List<Article> findArticleByAuthorId(Integer authorId);//根据作者id查询文章
    int addOneNum(Integer id);//使文章阅读数+1
    int updateArticleById(Article article);//根据文章id修改文章
    int deleteArticleById(Integer id);//根据文章id删除文章
//    List<Article> findArticleByTitle(String title);//根据标题查询文章(模糊查询)
}
