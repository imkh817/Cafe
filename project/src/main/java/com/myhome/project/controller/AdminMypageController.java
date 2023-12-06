package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myhome.project.model.Inquiry;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Response;
import com.myhome.project.service.InquiryService;

@Controller
public class AdminMypageController {

	@Autowired
	InquiryService inquiryService;
	
	// 관리자 1대1 문의 폼
	@RequestMapping("adminInquiry")
	public String adminInquiry(String page,Model model) {
		
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		int currentPage = Integer.parseInt(page);
		
		int rowperPage = 10;
		int startRow = (currentPage-1) * rowperPage +1;
		int endRow = rowperPage + startRow -1;
		int total = inquiryService.getTotalInquiry();
		
		
		PagingPgm pp = new PagingPgm(total, rowperPage, currentPage);
		Inquiry inquiry = new Inquiry();
		inquiry.setStartRow(startRow);
		inquiry.setEndRow(endRow);
		
		List<Inquiry> list = new ArrayList<Inquiry>();
		list = inquiryService.getListInquiry(inquiry); //관리자 페이지용
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getResponse_state().equals("N")) {
				list.get(i).setResponse_state("답변 대기");
			}else {
				list.get(i).setResponse_state("답변 완료");
				
			}
		}
		model.addAttribute("page",pp);
		model.addAttribute("list",list);
		return "admin/adminInquiry";
	}
	
	// 관리자 1대1문의 답변페이지 폼
	@RequestMapping("adminInquiry_response")
	public String adminInquiry_response(String inquiry_no,Model model) {
		
		Inquiry inquiry = new Inquiry();
		inquiry = inquiryService.getOneInquiry(inquiry_no); // 한개의 문의글 가지고오기
		System.out.println("가져온 문의글 제목 : " + inquiry.getInquiry_title());
		model.addAttribute("inquiry",inquiry);
		
		// 답변을 했을 경우
		Response response = inquiryService.getResponse(inquiry_no);
		System.out.println(inquiry_no);
		if(response != null) {
			model.addAttribute("response",response);
		}
		
		return "admin/adminInquiry_response";
	}
	
	// 관리자 1대1문의 답변 작성
	@RequestMapping("writeResponse")
	public String writeResponse(int inquiry_no,Model model,Response response) {
		
		int result = inquiryService.insertResponse(response);
		if(result == 1) {
			System.out.println("번호 : " + inquiry_no);
			inquiryService.updateResponseState(inquiry_no);
		}
		model.addAttribute("result",result);
			
		return "admin/writeResponseResult";
	}
	
}
