package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.LikedDao;
import com.myhome.project.model.Liked;

@Service
public class LikedServiceImpl implements LikedService {

	@Autowired
	LikedDao dao;

//	찜목록 이동
	@Override
	public List<Map<String, Object>> getLikedListByNo(Liked liked) {
		return dao.getLikedListByNo(liked);
	}

//	찜 개수
	@Override
	public int getTotal(Liked liked) {
		return dao.getTotal(liked);
	}

//	지금 바로 확인하기 버튼 클릭 및 카페 이름 클릭 이동
	@Override
	public List<Liked> moveLikedToDetail(int cafe_no) {
		return dao.moveLikedToDetail(cafe_no);
	}

}