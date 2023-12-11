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

	// 카페 등록
	public void insertBoard(Cafe cafe) throws Exception ;

	// 카페 수정
	public void updateBoard(Cafe cafe);

	// 카페 조회수
	public void cafe_readcount(int cafe_no);
	
	// 카페 데이터 조회
	public Cafe select(int cafe_no);

}
