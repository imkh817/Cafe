package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.project.model.Cafe;
import com.myhome.project.model.Category;
import com.myhome.project.model.Inquiry;
import com.myhome.project.model.Member;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Response;
import com.myhome.project.service.CafeService;
import com.myhome.project.service.CategoryService;
import com.myhome.project.service.InquiryService;
import com.myhome.project.service.MemberService;

@Controller
public class AdminMypageController {

	@Autowired
	InquiryService inquiryService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	CafeService cafeService;

	// 관리자 1대1 문의 폼
	@RequestMapping("adminInquiry")
	public String adminInquiry(String page, Model model) {

		if (page == null || page.equals("")) {
			page = "1";
		}

		int currentPage = Integer.parseInt(page);

		int rowperPage = 10;
		int startRow = (currentPage - 1) * rowperPage + 1;
		int endRow = rowperPage + startRow - 1;
		int total = inquiryService.getTotalInquiry();

		PagingPgm pp = new PagingPgm(total, rowperPage, currentPage);
		Inquiry inquiry = new Inquiry();
		inquiry.setStartRow(startRow);
		inquiry.setEndRow(endRow);

		List<Inquiry> list = new ArrayList<Inquiry>();
		list = inquiryService.getListInquiry(inquiry); // 관리자 페이지용

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getResponse_state().equals("N")) {
				list.get(i).setResponse_state("답변 대기");
			} else {
				list.get(i).setResponse_state("답변 완료");

			}
		}
		model.addAttribute("page", pp);
		model.addAttribute("list", list);
		return "admin/adminInquiry";
	}

	// 관리자 1대1문의 답변페이지 폼
	@RequestMapping("adminInquiry_response")
	public String adminInquiry_response(String inquiry_no, Model model) {

		Inquiry inquiry = new Inquiry();
		inquiry = inquiryService.getOneInquiry(inquiry_no); // 한개의 문의글 가지고오기
		System.out.println("가져온 문의글 제목 : " + inquiry.getInquiry_title());
		model.addAttribute("inquiry", inquiry);

		// 답변을 했을 경우
		Response response = inquiryService.getResponse(inquiry_no);
		System.out.println(inquiry_no);
		if (response != null) {
			model.addAttribute("response", response);
		}

		return "admin/adminInquiry_response";
	}

	// 관리자 1대1문의 답변 작성
	@RequestMapping("writeResponse")
	public String writeResponse(int inquiry_no, Model model, Response response) {

		int result = inquiryService.insertResponse(response);
		if (result == 1) {
			System.out.println("번호 : " + inquiry_no);
			inquiryService.updateResponseState(inquiry_no);
		}
		model.addAttribute("result", result);

		return "admin/writeResponseResult";
	}
	
	// 관리자 회원관리
		@RequestMapping("/manage")
		public String manage(Model model) {
			
			System.out.println("manage진");
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			list = memberService.getTotalMember();
			
			model.addAttribute("list",list);
			
			return "admin/manage";
		}
		@RequestMapping("deleteMemberManage")
		@ResponseBody
		public int deleteMemberManage(@RequestParam String member_id) {
			int result = memberService.memberDelete(member_id);
		    return result;
		}
		
		// 관리자 장소등록 폼
		@RequestMapping("/newPlace")
		public String newPlace(Model model) {
			System.out.println("cafe 컨트롤러 newPlace 매핑");
			// 카테고리 값을 담을 변수 생성
			List<Category> categorylist = new ArrayList<Category>();

			// 카테고리 번호를 DAO에 보낸다.
			categorylist = categoryService.selectList();

			for (int i = 0; i < categorylist.size(); i++) {
				System.out.println(categorylist.get(i).getCategory_name());
			}
			
			// 뷰에 데이터 값 전달
			model.addAttribute("category", categorylist);
			return "admin/newPlace";
		}
		// 관리자 장소 수정 폼
			@RequestMapping("/modifyPlace")
			public String modifyPlace(int cafe_no, Model model) {
				System.out.println("Modify controller");
				
				System.out.println("cafe 컨트롤러 newPlace 매핑");
				// 카테고리 값을 담을 변수 생성
				List<Category> categorylist = new ArrayList<Category>();

				// 카테고리 번호를 DAO에 보낸다.
				categorylist = categoryService.selectList();

				for (int i = 0; i < categorylist.size(); i++) {
					System.out.println(categorylist.get(i).getCategory_name());
				}
				
				Cafe cafe = cafeService.select(cafe_no);
				System.out.println("cafe category: " + cafe.getCategory_no());

				// 뷰에 데이터 값 전달
				model.addAttribute("category", categorylist);
				model.addAttribute("cafe", cafe);
				
				return "admin/modifyPlace";
			}
		
}
