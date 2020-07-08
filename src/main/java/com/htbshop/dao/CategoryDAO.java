package com.htbshop.dao;

import java.util.List;

import com.htbshop.entity.Category;

public interface CategoryDAO {
	Category findById(Integer id);
	List<Category> findAll();
	Category create(Category entity);
	void update(Category entity);
	Category delete(Integer id);

}