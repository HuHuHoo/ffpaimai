package com.auction.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.auction.domain.IdNameEntity;
import com.auction.util.ReflectionUtils;

@Repository(value = "baseDAO")
public class BaseDAO<T> extends HibernateDaoSupport {
	protected Class<T> entityClass;
	protected String className;

	public BaseDAO() {
		entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
		className = entityClass.getName();
	}

	public void saveOrUpdate(Object object) {
		getHibernateTemplate().saveOrUpdate(object);
	}

	public void delete(Object object) {
		if (object != null) {
			getHibernateTemplate().delete(object);
		}
	}

	public void merge(Object object) {
		getHibernateTemplate().merge(object);
	}

	public T findById(Long id) {
		if (id != null) {
			return getHibernateTemplate().get(entityClass, id);
		}
		return null;
	}

	public void deleteById(Long id) {
		T findById = findById(id);
		if (findById != null) {
			delete(findById);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> listAll() {
		return getHibernateTemplate().find("from " + className + " order by id desc");
	}

	public void update(Object object) {
		getHibernateTemplate().update(object);
	}

	@SuppressWarnings("unchecked")
	public List<T> findByIds(Long... ids) {
		if (!ArrayUtils.isEmpty(ids)) {
			return getSessionFactory().getCurrentSession().createQuery("from " + className + "  where id in(:ids) order by id desc").setParameterList("ids", ids).list();
		}
		return Collections.EMPTY_LIST;
	}

	@SuppressWarnings("unchecked")
	public List<T> findByIds(Collection<Long> ids) {
		if (CollectionUtils.isNotEmpty(ids)) {
			return getSessionFactory().getCurrentSession().createQuery("from " + className + "  where id in(:ids) order by id desc").setParameterList("ids", ids).list();
		}
		return Collections.EMPTY_LIST;
	}

	@Autowired
	public void setSessionFactoryForSuperrClass(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void executeSql(String sql) {
		getSessionFactory().getCurrentSession().createSQLQuery(sql).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public T findByName(String name) {
		List<T> find = getHibernateTemplate().find("from " + className + " t where t.name=?", new Object[] { name });
		return find.isEmpty() ? null : find.get(0);
	}

	public void delete(Collection<Long> ids) {
		if (CollectionUtils.isNotEmpty(ids)) {
			for (Long id : ids) {
				deleteById(id);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> listByStatus(int status) {
		return getHibernateTemplate().find("from " + className + " where status= " + status + " order by id desc");
	}

	@SuppressWarnings("unchecked")
	public List<Long> findIdByNameAndTableName(String name, String tableName) {
		String sql = "select id as id from " + tableName + " where name = '" + name + "'";
		return getSessionFactory().getCurrentSession().createSQLQuery(sql).addScalar("id", StandardBasicTypes.LONG).list();
	}

	@SuppressWarnings("unchecked")
	public List<IdNameEntity> findIdNameBySql(String sql) {
		return getSessionFactory().getCurrentSession().createSQLQuery(sql).addScalar("id", StandardBasicTypes.LONG).addScalar("name", StandardBasicTypes.STRING).setResultTransformer(Transformers.aliasToBean(IdNameEntity.class)).list();
	}
}