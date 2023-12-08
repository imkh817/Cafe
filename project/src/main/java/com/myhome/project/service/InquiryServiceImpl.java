package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.InquiryDao;
import com.myhome.project.model.Inquiry;
import com.myhome.project.model.Response;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDao dao;

//	문의목록 조회
	@Override
	public List<Inquiry> inquiryList(Inquiry inquiry) {
		return dao.inquiryList(inquiry);
	}

//	문의글 수
	@Override
	public int getTotal(Inquiry inquiry) {
		return dao.getTotal(inquiry);
	}

//	문의 제출
	@Override
	public int submitInquiry(Inquiry inquiry) {
		return dao.submitInquiry(inquiry);
	}

// 문의 상세페이지
	@Override
	public List<Map<Integer, Object>> detailInquiry(Inquiry inquiry) {
		return dao.detailInquiry(inquiry);
	}

//	문의 수정
	@Override
	public int updateInquiry(Inquiry inquiry) {
		return dao.updateInquiry(inquiry);
	}

//	게시글 확인 (첨부파일 수정에 필요함)
	@Override
	public Inquiry noCheck(int inquiry_no) {
		return dao.noCheck(inquiry_no);
	}

//	문의 삭제
	@Override
	public int deleteInquiry(Inquiry inquiry) {
		return dao.deleteInquiry(inquiry);
	}

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
