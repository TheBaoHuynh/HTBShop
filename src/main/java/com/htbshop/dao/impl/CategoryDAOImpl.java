package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.CategoryDAO;
import com.htbshop.entity.Category;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory fatory;

	@Override
	public Category findById(Integer id) {
		Session session = fatory.getCurrentSession();
		Category entity = session.find(Category.class, id);
		return entity;
	}

	@Override
	public List<Category> findAll() {
		String hql = "FROM Category";
		Session session = fatory.getCurrentSession();
		TypedQuery<Category> query = session.createQuery(hql, Category.class);
		List<Category> list = query.getResultList();
		return list;
	}

	@Override
	public Category create(Category entity) {
		Session session = fatory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Category entity) {
		Session session = fatory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Category delete(Integer id) {
		Session session = fatory.getCurrentSession();
		Category entity = session.find(Category.class, id);
		session.delete(entity);
		return entity;
	}

}
