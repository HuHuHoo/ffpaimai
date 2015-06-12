package com.auction.aop;

import org.hibernate.event.PostLoadEvent;
import org.hibernate.event.PostLoadEventListener;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;

public class SpringHibernateInjector implements PostLoadEventListener, BeanFactoryAware {

	private static final long serialVersionUID = -7016139787914797909L;
	private AutowireCapableBeanFactory beanFactory;

	public void onPostLoad(PostLoadEvent event) {
		Object hibernateObject = event.getEntity();
		beanFactory.autowireBeanProperties(hibernateObject, AutowireCapableBeanFactory.AUTOWIRE_BY_NAME, false);
	}

	public void setBeanFactory(BeanFactory factory) {
		beanFactory = (AutowireCapableBeanFactory) factory;
	}

}
