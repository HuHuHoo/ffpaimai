package com.auction.dao;

import com.auction.domain.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by loovis on 8/27/14.
 */
@Repository
public class ArticleDAO extends BaseDAO <Article> {
    public Article findByEntityId(Long entityId) {
        List<Article> list = getHibernateTemplate().find("from Article a where a.entityId=" + entityId);
        return list.isEmpty()?null:list.get(0);
    }
}
