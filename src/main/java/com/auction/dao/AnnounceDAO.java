package com.auction.dao;

import com.auction.constants.Constants;
import com.auction.domain.Announce;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by loovis on 9/2/14.
 */
@Repository
public class AnnounceDAO extends BaseDAO<Announce> {
    public List<Announce> findByRecommendAndFreshAndStatus(int recommend, int fresh, int status) {
        if (recommend==-1||fresh==-1){
            return listByStatus(Constants.ACTIVE_STATUS);
        }
        StringBuilder sb = new StringBuilder("from Announce as a where a.status=");
        sb.append(status);
        sb.append(" and recommend=").append(recommend == 0 ? 0 : 1);
        sb.append(" and fresh=").append(fresh == 0 ? 0 : 1);
        sb.append(" order by a.id desc");
        return getHibernateTemplate().find(sb.toString());
    }
}
