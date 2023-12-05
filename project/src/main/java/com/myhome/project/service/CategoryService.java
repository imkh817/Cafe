package com.myhome.project.service;

import java.util.List;

import com.myhome.project.model.Category;

public interface CategoryService {

	
	List<Category> selectList();

	int selectNo(String category_name);

}
