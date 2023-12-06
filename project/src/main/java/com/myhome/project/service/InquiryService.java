package com.myhome.project.service;

import java.util.List;

import com.myhome.project.model.Inquiry;
import com.myhome.project.model.Response;

public interface InquiryService {

	// 관리자 - 문의 페이지 폼
	int getTotalInquiry();
	List<Inquiry> getListInquiry(Inquiry inquiry);

	// 관리자 - 문의 답변 페이지 폼
	Inquiry getOneInquiry(String inquiry_no);
	Response getResponse(String inquiry_no);
	
	// 관리자 - 답변 작성
	int insertResponse(Response response);
	// 관리자 - 문의한 사람의 답변상태 변경
	void updateResponseState(int inquiry_no);

}
