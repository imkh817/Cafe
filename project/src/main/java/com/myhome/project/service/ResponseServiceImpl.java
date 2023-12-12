package com.myhome.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.ResponseDao;
import com.myhome.project.model.Response;

@Service
public class ResponseServiceImpl implements ResponseService{

	@Autowired
	ResponseDao dao;
	
	@Override
	public int insertResponse(Response response) {
		return dao.insertResponse(response);
	}

	@Override
	public int updateResponse(Response response) {
		return dao.updateResponse(response);
	}

	@Override
	// 관리자 - 문의한 사람의 답변상태 변경
	public void updateResponseState(int inquiry_no) {
		dao.updateResponseState(inquiry_no);
		
	}

	@Override
	public int checkResponse(int inquiry_no) {
		return dao.checkResponse(inquiry_no);
	}

	@Override
	public Response getResponse(String inquiry_no) {
		return dao.getResponse(inquiry_no);
	}

}
