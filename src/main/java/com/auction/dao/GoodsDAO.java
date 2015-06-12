package com.auction.dao;

import com.auction.constants.GoodsType;
import com.auction.domain.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by loovis on 8/27/14.
 */
@Repository
public class GoodsDAO extends BaseDAO<Goods> {

    public List<Goods> findByStatusAndType(int status, GoodsType type) {
        return getHibernateTemplate().find(" from Goods as g where g.status= " + status + " and g.type= '" + type.name() + "' order by g.id desc");
    }
}
