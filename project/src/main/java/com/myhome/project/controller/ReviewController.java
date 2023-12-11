package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myhome.project.dao.CafeDao;
import com.myhome.project.dao.HashtagDao;
import com.myhome.project.dao.ReviewDao;
import com.myhome.project.model.Cafe;
import com.myhome.project.model.Hashtag;
import com.myhome.project.model.Review;
import com.myhome.project.service.ReviewService;
import com.myhome.project.service.reviewPaging;

@Controller
public class ReviewController {
	
	@Autowired
	private HashtagDao hashdao;
	
	@Autowired
	private CafeDao cafedao; 
	
	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping("Detail")
	public String gethashtag(@RequestParam("cafe_no") int cafe_no,String pageNum, Model model, HttpSession session) {
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		// 해시 태그 목록 가져오기
		List<Hashtag> hashtag = new ArrayList<Hashtag>();
		hashtag = hashdao.gethashtag();
		
		for(int i=0; i<hashtag.size(); i++) {
			System.out.println(hashtag.get(i).getHash_name());
		}
		
		// 카페 목록 가져오기
		List<Cafe> cafelist = new ArrayList<Cafe>();
		cafelist = cafedao.getcafe(cafe_no);
		
		System.out.println("cafelist : " + cafelist.get(0).getCafe_name());
		

		// 로그인 되면 id가 세션에 저장된걸 가정
		String id = (String) session.getAttribute("id"); 
		

		model.addAttribute("tag",hashtag);
		model.addAttribute("pageNum",pageNum); 
		model.addAttribute("cafelist",cafelist);
		model.addAttribute("cafe_no",cafe_no);
		model.addAttribute("id",id);
		
		return "cafe/detail";
	}
	
	// 리뷰 작성
	@RequestMapping("ReviewInsert")
	public String review_insert(Review review, HttpSession session, Model model ) {
		
		review.setMember_id((String)session.getAttribute("id"));
		
		int result = reviewService.review_insert(review);
		
		// 리뷰 작성성공하면 cafe테이블 avg_cafe_star update
		if(result > 0) {
			// cafe_star 평균값 구해오기
			double avg_star = reviewService.avg_star(review.getCafe_no());
			
			Cafe cafe =  new Cafe();
			cafe.setAvg_cafe_star(avg_star);
			cafe.setCafe_no(review.getCafe_no());
			
			// avg_cafe_star 컬럼 update
			cafedao.update_avg_cafe_star(cafe);
		}
		
		model.addAttribute("result",result);
		model.addAttribute("cafe_no",review.getCafe_no());
		
		return "cafe/insert_result";
	}
	
	// 리뷰 목록
	@RequestMapping("ReviewList")
	public String review_list(@RequestParam("cafe_no")int cafe_no, String pageNum, Review review, Model model) {

		// 페이징
		final int rowPerPage = 5;
		
		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage:"+currentPage);
		
		int total = reviewService.getTotal(review);
		System.out.println("total: "+ total);
		
		int startRow = (currentPage-1)*rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		
		reviewPaging rp = new reviewPaging(total, rowPerPage, currentPage);
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		
		
		System.out.println("startRow : "+review.getStartRow());
		System.out.println("endRow : "+review.getEndRow());
		 
		
//		int no = total - startRow +1;
		
		// 조인한 테이블 목록 구해오기
		List<Map<String, Object>> reviewList = new ArrayList<Map<String, Object>>();
		reviewList = reviewService.review_list(review);

		for (int i = 0; i < reviewList.size(); i++) {
			System.out.println(reviewList.get(i));
		}

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("rp", rp);
//		model.addAttribute("no", no);
		
		return "cafe/review_list";
	}
	
	
}
