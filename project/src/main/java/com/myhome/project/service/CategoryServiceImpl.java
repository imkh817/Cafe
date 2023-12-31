package com.myhome.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.CategoryDao;
import com.myhome.project.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDao dao;

	@Override
	public List<Category> selectList() {
		return dao.selectList();
	}

	@Override
	public int selectNo(String category_name) {
		return dao.selectNo(category_name);
	}
	
	
}
