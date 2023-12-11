package com.myhome.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.CafeDao;
import com.myhome.project.model.Cafe;

@Service
public class CafeServiceImpl implements CafeService {

	@Autowired
	private CafeDao dao;

	// 글 작성 처리
	public void cafe_insert(Cafe cafe) throws Exception {
		System.out.println("BoardServiceimpl");
		dao.insertBoard(cafe);
	}

	// 글 수정 처리
	public void cafe_update(Cafe cafe) {
		dao.updateBoard(cafe);
	}

	// 조회수 증가
	public void cafe_readcount(int cafe_no) {
		dao.updateCaferead(cafe_no);
	}

	// 카페 정보
	public Cafe select(int cafe_no) {
		return dao.select(cafe_no);
	}

}
