package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.ReportDAO;

@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> inventory() {
		// TODO Auto-generated method stub
		String hql = "SELECT p.category.name,"
				+ " SUM(p.quantity),"
				+ " SUM(p.unitPrice * p.quantity),"
				+ " MIN(p.unitPrice),"
				+ " MAX(p.unitPrice),"
				+ " AVG(p.unitPrice)"
				+ " FROM Product p"
				+ " GROUP BY p.category.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCategory() {
		// TODO Auto-generated method stub
		String hql = "SELECT d.product.category.name,"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice * d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.product.category.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCustomer() {
		// TODO Auto-generated method stub
		String hql = "SELECT d.order.customer.id,"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice * d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.order.customer.id";
//				+ " ORDER BY SUM(d.unitPrice*d.quantity) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByYear() {
		// TODO Auto-generated method stub
		String hql = "SELECT YEAR(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice * d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY YEAR(d.order.orderDate)"
				+ "ORDER BY YEAR(d.order.orderDate) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByQuarter() {
		// TODO Auto-generated method stub
		String hql = "SELECT CEILING(MONTH(d.order.orderDate)/3.0),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice * d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY CEILING(MONTH(d.order.orderDate)/3.0)"
				+ "ORDER BY CEILING(MONTH(d.order.orderDate)/3.0)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByMonth() {
		// TODO Auto-generated method stub
		String hql = "SELECT MONTH(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice * d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY MONTH(d.order.orderDate)"
				+ "ORDER BY MONTH(d.order.orderDate) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

}
