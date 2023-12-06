package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Cafe;

public interface listService {

	// 카테고리별 카페 목록 구해오기
	List<Cafe> getCafeList(Cafe cafe);

	// 카페고리별 총 카페 갯수
	int countCafeList(Cafe cafe);
}
