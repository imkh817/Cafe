package com.myhome.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Hashtag;

@Mapper
public interface HashtagDao {

	List<Hashtag> gethashtag();
}
