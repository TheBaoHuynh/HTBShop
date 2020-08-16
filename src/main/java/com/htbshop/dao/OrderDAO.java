package com.htbshop.dao;

import java.util.List;

import com.htbshop.entity.Customer;
import com.htbshop.entity.Order;
import com.htbshop.entity.OrderDetail;
import com.htbshop.entity.Product;

public interface OrderDAO {
	Order findById(Integer id);
	List<Order> findAll();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(Customer user);
	List<Product> findItemsByUser(Customer user);
	long getPageCount(int pageSize);
	List<Order> getPage(int pageNo, int pageSize);

}
