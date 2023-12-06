package com.myhome.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Cafe;

@Mapper
public interface CafeDao {

	List<Cafe> getcafe(int cafe_no);
	
	// 카테고리별 카페목록 구해오기
	List<Cafe> getCafeList(Cafe cafe);
	
	// 카테고리별 카페 총 갯수
	int countCafeList(Cafe cafe);
	
	// avg_cafe_star 컬럼 update
	void update_avg_cafe_star(Cafe cafe);

}
