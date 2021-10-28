package com.zhangheng.service.impl;

import com.zhangheng.dao.ArticleDao;
import com.zhangheng.po.Article;
import com.zhangheng.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    @Override
    public boolean addArticle(Article article) {
        int b=articleDao.addArticle(article);
        if (b > 0) {
//            System.out.println("Article添加成功！"+b);
            return true;
        } else {
//            System.out.println("Article添加失败！"+b);
            return false;
        }
    }

    @Override
    public List<Article> findArticleAll() {
        List<Article> articleAll = articleDao.findArticleAll();
        return articleAll;
    }

    @Override
    public Article findArticleById(Integer id) {
        Article articleById = articleDao.findArticleById(id);
        return articleById;
    }

    @Override
    public List<Article> findArticleByAuthorId(Integer authorId) {
        List<Article> articleByAuthorId = articleDao.findArticleByAuthorId(authorId);
        return articleByAuthorId;
    }

    @Override
    public boolean addOneNum(Integer id) {
        int i = articleDao.addOneNum(id);
        if (i==1){
//            System.out.println(id+"的阅读量成功+1！");
            return true;
        }else {
//            System.out.println(id+"的阅读量失败+1！");
            return false;
        }
    }

    @Override
    public boolean updateArticleById(Article article) {
        int i = articleDao.updateArticleById(article);
        if (i==1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteArticleById(Integer id) {
        int i = articleDao.deleteArticleById(id);
        if (i==1){
            return true;
        }else {
            return false;
        }
    }

}
