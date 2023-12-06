package com.myhome.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.InquiryDao;
import com.myhome.project.model.Inquiry;
import com.myhome.project.model.Response;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	InquiryDao dao;

	// 관리자 - 문의 페이지 폼
	public int getTotalInquiry() {
		return dao.getTotalInquiry();
	}

	public List<Inquiry> getListInquiry(Inquiry inquiry) {
		return dao.getListInquiry(inquiry);
	}

	// 관리자 - 문의 답변 페이지 폼	
	public Inquiry getOneInquiry(String inquiry_no) {
		return dao.getOneInquiry(inquiry_no);
	}

	public Response getResponse(String inquiry_no) {
		return dao.getResponse(inquiry_no);
	}

	// 관리자 - 답변 작성
	public int insertResponse(Response response) {
		return dao.insertResponse(response);
	}

	// 관리자 - 문의한 사람의 답변상태 변경
	public void updateResponseState(int inquiry_no) {
		dao.updateResponseState(inquiry_no);
		
	}
	
	
	
}
