package com.myhome.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Response;

@Mapper
public interface ResponseDao {

	int insertResponse(Response response);

	int updateResponse(Response response);

	void updateResponseState(int inquiry_no);

	int checkResponse(int inquiry_no);

	Response getResponse(String inquiry_no);

}
