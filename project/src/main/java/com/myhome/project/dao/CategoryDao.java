package com.myhome.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Category;

@Mapper
public interface CategoryDao {

	List<Category> selectList();

}
