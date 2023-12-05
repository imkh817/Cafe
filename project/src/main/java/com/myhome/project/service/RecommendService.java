package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Recommend;
import com.myhome.project.model.Reply;

public interface RecommendService {


	int getTotal();

	List<Map<String, Object>> getList(Recommend recommend);




}
