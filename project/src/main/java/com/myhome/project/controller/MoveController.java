package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myhome.project.dao.HashtagDao;
import com.myhome.project.model.Cafe;
import com.myhome.project.model.Category;
import com.myhome.project.model.Hashtag;
import com.myhome.project.model.Member;
import com.myhome.project.model.Liked;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Recommend;
import com.myhome.project.model.Reply;
import com.myhome.project.model.Review;
import com.myhome.project.service.CafeService;
import com.myhome.project.service.CategoryService;
import com.myhome.project.service.LikedService;
import com.myhome.project.service.MemberService;
import com.myhome.project.service.RecommendService;
import com.myhome.project.service.ReplyService;
import com.myhome.project.service.ReviewService;
import com.myhome.project.service.listService;
import com.myhome.project.service.reviewPaging;

@Controller
public class MoveController {

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	listService listService;
	
	@Autowired
	CafeService cafeService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LikedService likedService;
	
	@Autowired
	HashtagDao hashdao;
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}

	@RequestMapping("/header")
	public String go() {
		return "include/header";
	}

	// 메인 페이지로 이동
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		
		 // 세션에서 nearByCafe 값을 삭제
        session.removeAttribute("nearByCafe");
		
		List<Category> list = new ArrayList<Category>();
		list = categoryService.selectList();
		
		model.addAttribute("list",list);
		return "cafe/main";
	}
	
	// list 페이지에서 사용자 위치받아오는 메서드
	@RequestMapping("nearByCafe")
	public String nearByCafe(@RequestParam("latitude") String latitude ,@RequestParam("longitude")String longitude, Model model, HttpSession session) 
			throws JsonMappingException, JsonProcessingException {
		
		System.out.println("Latitude: " + latitude);
		System.out.println("Longitude: " + longitude);
		
		String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longitude+"&y="+latitude;
	    
	    org.springframework.http.HttpHeaders head = new org.springframework.http.HttpHeaders();
	    head.add("Authorization", "KakaoAK 72a3c2462f8bf6a9fc2b9c2f3daffb33");
	    
	    HttpEntity<Object> entity = new HttpEntity<Object>(head);
	    
	    RestTemplate template = new RestTemplate();
	    
	    ResponseEntity<String> response = template.exchange(url, HttpMethod.GET, entity, String.class);
	    
	    String body = response.getBody();
	    
	    System.out.println(body);
	    
	    ObjectMapper mapper = new ObjectMapper();
	    com.myhome.project.model.KaKaoLocationResponse result = mapper.readValue(body, com.myhome.project.model.KaKaoLocationResponse.class);
	    
	    if(result == null) {
	    	System.out.println("null입니다.");
	    }
	    
	    
	    String address = result.getDocuments().get(0).getAddress().getRegion2depthName();
	    System.out.println("주소 : " + address);
	    
	    address = address.substring(0, address.length() - 1);
	    System.out.println("자른 주소: " + address);
	    
	    // API로 받아온 사용자 주소값을 sesion에 저장
	    session.setAttribute("nearByCafe", address);
	    System.out.println("session에 저장된 주소: "+ session.getAttribute("nearByCafe"));
	    
	    return "cafe/list";
		
	}

	// 목록 페이지로 이동
	@RequestMapping("/list")
	public String g2(@RequestParam(name = "pageNum", defaultValue = "1") String pageNum, Cafe cafe, Model model, HttpSession session) {

		System.out.println("카테고리 번호: "+ cafe.getCategory_no());
		
		// 검색 버튼을 눌렀을 때 넘어온 keyword 저장
		cafe.setKeyword(cafe.getKeyword());

		// 받아온 주소값 저장
		System.out.println("cafe 세션에서 받아온 주소: "+session.getAttribute("nearByCafe"));
		cafe.setNearByCafe((String)session.getAttribute("nearByCafe"));
		System.out.println("cafe에 저장된 nearByCafe: " + cafe.getNearByCafe());
		
		// 페이징
		final int rowPerPage = 6;
		
		int currentPage = Integer.parseInt(pageNum);

		int total = listService.countCafeList(cafe);

		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		reviewPaging rp = new reviewPaging(total, rowPerPage, currentPage);
		cafe.setStartRow(startRow);
		cafe.setEndRow(endRow);

		// 카페 목록 구해오기
		List<Cafe> cafe_list = new ArrayList<Cafe>();
		cafe_list = listService.getCafeList(cafe);

		for (int i = 0; i < cafe_list.size(); i++) {
			System.out.println(cafe_list.get(i).getCafe_name());
		}

		model.addAttribute("cafe_list", cafe_list);
		model.addAttribute("cafe", cafe);
		model.addAttribute("rp", rp);

		return "cafe/list";
	}


		// 상세 페이지로 이동
		@RequestMapping("/detail")
		public String cafe_detail(int cafe_no, Review review, HttpSession session, Model model, String pageNum) {

			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}

			// 리뷰

			// 해시 태그 목록 가져오기
			List<Hashtag> hashtag = new ArrayList<Hashtag>();
			hashtag = hashdao.gethashtag();

			// update
			// 조회수 증가
			System.out.println("detail컨트롤러 cafe_no : " + cafe_no);
			cafeService.cafe_readcount(cafe_no);

			// select
			// 카페 정보
			Cafe cafe = cafeService.select(cafe_no);
			System.out.println("cafe:" + cafe);
			// 해시 태그 평균 값
			List<Map<String, Object>> hashAvg = new ArrayList<Map<String, Object>>();
			hashAvg = reviewService.hash_avg(review);
			// 넘어온 값 확인
			for (int i = 0; i < hashAvg.size(); i++)
				System.out.println(hashAvg.get(i));
			// 별점 평균 값
			double star = reviewService.starAvg(cafe_no);
			System.out.println("star:" + star);

			// 하트
			// liked테이블에서 해당 값을 구해오려면 cafe_no와 member_id값이 필요하다.
			String id = (String) session.getAttribute("id");
			System.out.println("session에 저장된 값:" + id);
			System.out.println("cafe_no: " + cafe_no);
			int result = 0;
			if (id != null) {
				Liked liked = new Liked();
				liked.setCafe_no(cafe_no);
				liked.setMember_id(id);
				Liked tmpLiked = likedService.selectLike(liked);

				System.out.println("tmpLiked :" + tmpLiked);
				if (tmpLiked != null) {
					result = 1;
				}
			}

			// 뷰 파일로 값 넘기기
			// 카페 정보
			model.addAttribute("cafe", cafe);
			// 해시 태그 평균 값
			model.addAttribute("hashAvg", hashAvg);
			// 별점 가져오기
			model.addAttribute("star", star);
			// 찜 상태 가져오기
			model.addAttribute("liked", result);

			model.addAttribute("tag", hashtag);

			model.addAttribute("pageNum", pageNum);
			model.addAttribute("id", id);

			return "cafe/detail";
		}

}
