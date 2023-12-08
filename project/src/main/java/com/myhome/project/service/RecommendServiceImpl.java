package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.RecommendDao;
import com.myhome.project.model.Recommend;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	RecommendDao dao;

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public int insert(Recommend board) {

		return dao.insert(board);
	}

	@Override
	public int getCount() {

		return dao.getCount();
	}

	@Override
	public List<Recommend> getBoardList(String page) {

		return getBoardList(page);
	}

	@Override
	public void updatecount(int rec_no) {

		dao.updatecount(rec_no);
	}

	@Override
	public Recommend getBoard(int rec_no) {

		return dao.getBoard(rec_no);
	}

	@Override
	public int update(Recommend board) {

		return dao.update(board);
	}

	@Override
	public int delete(int rec_no) {

		return dao.delete(rec_no);
	}

	@Override
	public List<Map<String, Object>> getList(Recommend recommend) {

		return dao.getList(recommend);
	}
}
