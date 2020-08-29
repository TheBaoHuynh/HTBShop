package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Product findById(Integer id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		return entity;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Product p";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public Product create(Product entity) {

		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Product delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<Product> findByCategoryId(Integer categoryId) {
		String hql = "FROM Product p WHERE p.category.id =:cid";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("cid", categoryId);
		query.setMaxResults(12);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByKeywords(String keywords) {
		String hql = "FROM Product p " + "WHERE p.name LIKE :kw OR p.category.name LIKE :kw";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("kw", "%" + keywords + "%");
		List<Product> list = query.getResultList();
		return list;

	}

	@Override
	public List<Product> findByIds(String ids) {
		String hql = "FROM Product p WHERE p.id in (" + ids + ")";
		System.out.println("yeu thich" + hql);
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setMaxResults(10);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findBySpecial(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p";
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		switch (id) {
		case 0: // moi
			hql = "FROM Product p ORDER BY p.productDate DESC";
			break;
		case 1: //ban chay
			hql = "FROM Product p ORDER BY size(p.orderDetails) DESC";
			break;
		case 2: //xem nhieu
			hql = "FROM Product p ORDER BY p.viewCount DESC";
			break;
		case 3: //giam gia
			hql = "FROM Product p ORDER BY p.discount DESC";
			break;
		}
		query = session.createQuery(hql,Product.class);
		query.setMaxResults(12);
		System.out.println(hql);
		List<Product> list = query.getResultList();
		return list;
	}
	//phan trang
	@Override
	public long getPageCount(int pageSize) {
		// TODO Auto-generated method stub
		String hql = "SELECT count(p) FROM Product p";
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount = (long) Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	@Override
	public List<Product> getPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		String hql = "FROM Product p ORDER BY p.productDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Product> list = query.getResultList();
		return list;
	}

}
