package com.auction.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.auction.domain.User;

@Repository
public class UserDAO extends BaseDAO<User> {

	@SuppressWarnings("unchecked")
	public User findUserByNameOrEmail(String name, String email) {
		List<User> find = getHibernateTemplate().find("from User u where u.name=? or u.email=?", new Object[] { name, email });
		return find.isEmpty() ? null : find.get(0);
	}

}
