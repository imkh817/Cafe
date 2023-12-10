package com.myhome.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Liked;

@Mapper
public interface LikedDao {

	Liked selectLike(Liked ldto);

	int insertLike(Liked liked);

	int deleteLike(Liked liked);

	

}
