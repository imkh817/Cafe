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
	RecommendDao recDao;
	

	

	@Override
	public int getTotal() {
		return recDao.getTotal();
	}


	@Override
	public List<Map<String, Object>> getList(Recommend recommend) {
		return recDao.getList(recommend);
	}



}
