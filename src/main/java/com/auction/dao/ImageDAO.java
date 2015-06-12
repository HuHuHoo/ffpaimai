package com.auction.dao;

import com.auction.domain.Image;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by loovis on 2014/8/24.
 */
@Repository
public class ImageDAO extends BaseDAO<Image> {
    public List<Image> findByType(int type) {
        List<Image> find = getHibernateTemplate().find("from Image i where i.type=?", new Object[]{type});
        return find;
    }
}
