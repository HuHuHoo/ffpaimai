package com.auction.dao;

import com.auction.constants.ContentType;
import com.auction.domain.Content;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by loovis on 8/31/14.
 */
@Repository
public class ContentDAO extends BaseDAO<Content> {
    public List<Content> findByType(ContentType type){
        return  getHibernateTemplate().find("from Content c where c.type='"+type.name()+"' order by c.id desc");
    }
}
