package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Liked;

public interface LikedService {

//	찜목록 이동
	public List<Map<String, Object>> getLikedListByNo(Liked liked);

//	찜 개수
	public int getTotal(Liked liked);

//	지금 바로 확인하기 버튼 클릭 및 카페 이름 클릭 이동
	public List<Liked> moveLikedToDetail(int cafe_no);


	public Liked selectLike(Liked ldto);

	public int insertLike(Liked liked);

	public int deleteLike(Liked liked);

	
	
	
}
