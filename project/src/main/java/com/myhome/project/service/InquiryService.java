package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Inquiry;
import com.myhome.project.model.Response;

public interface InquiryService {

//	문의목록 조회
	public List<Inquiry> inquiryList(Inquiry inquiry);

//	문의글 수
	public int getTotal(Inquiry inquiry);

//	문의 제출
	public int submitInquiry(Inquiry inquiry);

//	문의 상세페이지
	public List<Map<Integer, Object>> detailInquiry(Inquiry inquiry);

//	문의 수정
	public int updateInquiry(Inquiry inquiry);

//	게시글 확인 (첨부파일 수정에 필요함)
	public Inquiry noCheck(int inquiry_no);

//	문의 삭제
	public int deleteInquiry(Inquiry inquiry);

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
