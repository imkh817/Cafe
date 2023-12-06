package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.CafeDao;
import com.myhome.project.model.Cafe;

@Service
public class listServiceImpl implements listService{

	@Autowired
	private CafeDao CafeDao;
	
	// 카테고리별 카페 목록 구해오기
	@Override
	public List<Cafe> getCafeList(Cafe cafe) {
		return CafeDao.getCafeList(cafe);
	}

	// 카테고리별 총 카페 갯수
	@Override
	public int countCafeList(Cafe cafe) {
		return CafeDao.countCafeList(cafe);
	}

}
