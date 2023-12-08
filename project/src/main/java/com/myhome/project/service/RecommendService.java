package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Recommend;
import com.myhome.project.model.Reply;

public interface RecommendService {


	int getTotal();

	List<Map<String, Object>> getList(Recommend recommend);

	int insert(Recommend board);

	int getCount();

	List<Recommend> getBoardList(String page);
	
	void updatecount(int rec_no);

	Recommend getBoard(int rec_no);

	int update(Recommend board);

	int delete(int rec_no) ;




	
}



