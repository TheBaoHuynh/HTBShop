package com.htbshop.dao;

import java.util.List;

import com.htbshop.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);
	List<Product> findAll();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	List<Product> findByKeywords(String keywords);
	List<Product> findByCategoryId(Integer categoryId);

}
