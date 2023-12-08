package com.myhome.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Recommend;

@Mapper
public interface RecommendDao {

	int getTotal();

	List<Map<String, Object>> getList(Recommend recommend);

	public int insert(Recommend board);

	public int getCount();

	public List<Recommend> getBoardList(String page);

	public void updatecount(int rec_no);

	public Recommend getBoard(int rec_no);

	public int update(Recommend board);

	public int delete(int rec_no);

}
