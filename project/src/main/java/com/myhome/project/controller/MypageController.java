package com.myhome.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Review;
import com.myhome.project.service.ReviewService;

@Controller
public class MypageController {

	@Autowired
	ReviewService reviewService;
	
	// 마이페이지 리뷰관리
	@RequestMapping("/myReview")
	public String myReview(HttpSession session, Model model,String page) {
		
		// 마이페이지 리뷰관리 페이징
		if(page == null || page.equals("")) {
			page = "1";
		}
		
		String id = (String)session.getAttribute("id");
		
		int rowPerPage = 10;// 리뷰 테이블에 출력할 데이터의 갯수
		int currentPage = Integer.parseInt(page); // 현재 페이지
		int total = reviewService.getTotalReviewCount(id); // 해당 아이디의 리뷰 총 갯수 구해오기
		int startRow = (currentPage-1) * rowPerPage + 1; // 페이징할때 테이블의 첫번째 행의 번호
		int endRow = startRow + rowPerPage -1; // 페이징할때 테이블의 마지막 행의 번호	
		
		PagingPgm pp = new PagingPgm(total,rowPerPage,currentPage); // 페이징 변수를 다 만들기 귀찮아서 클래스를 만들어서 처리했다
		
		
		// 쿼리문에 startRow와 endRow와 id값이 필요해서 review라는 빈 객체를 생성한 후에 값을 설정해줌
		Review review = new Review();
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		review.setMember_id(id);
		
		// 페이징처리 되게 리스트 뽑아오기
		List<Map<String, Object>> reviewPagingList = new ArrayList<Map<String,Object>>();
		reviewPagingList = reviewService.reviewPagingList(review);
		
		// 날짜를 포맷해서 바꿔주었다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(int i=0; i<reviewPagingList.size(); i++) {
			reviewPagingList.get(i).put("REVIEW_REG",sdf.format(reviewPagingList.get(i).get("REVIEW_REG"))) ;
		}
		
		// myReview페이지에서 페이지 표시를 하기위해 pp를 넘긴다.
		model.addAttribute("page",pp);
		model.addAttribute("id",id);
		// 페이징된 list를 넘긴다.
		model.addAttribute("reviewPagingList",reviewPagingList);
		
		return "mypage/myReview";
	}
	
	// 마이페이지 리뷰 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(String review_no, String page,Model model) {
		
		int deleteResult = reviewService.deleteReview(review_no);
		model.addAttribute("page",page);
		model.addAttribute("result",deleteResult);
		
		return "mypage/deleteReviewResult";
		
	}
}
