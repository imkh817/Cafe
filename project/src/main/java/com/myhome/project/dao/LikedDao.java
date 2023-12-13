package com.myhome.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Liked;

@Mapper
public interface LikedDao {

//	찜목록 이동
	public List<Map<String, Object>> getLikedListByNo(Liked liked);

//	찜 개수
	public int getTotal(Liked liked);

//	지금 바로 확인하기 버튼 클릭 및 카페 이름 클릭 이동
	public List<Liked> moveLikedToDetail(int cafe_no);
	
	Liked selectLike(Liked ldto);

	int insertLike(Liked liked);

	int deleteLike(Liked liked);

	

}
