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
	MemberService service;
	
	@Autowired
	RecommendService recService;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	private listService listService;
	
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




	// 클라이언트 추천 게시판 목록
	@RequestMapping("/recommendList")
	public String recommendList(String page, Model model, HttpSession session) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		int currentPage = Integer.parseInt(page);
		// 일단 데이터(글)가 페이지에 몇 개를 띄워줄 건지 정해야함
		int rowPerPage = 5;
		// startRow와 endRow는 rowPerPage에 종속될 수 밖에 없다. 그래서 식에 꼭rowPerPage가 들어갈 수 밖에 없다.
		int startRow = (currentPage - 1) * rowPerPage + 1; // 1, 6, 11...
		int endRow = startRow + rowPerPage - 1; // 5, 10, 15...

		// total(db에 있는 전체 데이터 갯수)를 구해야 페이징할 때 페이지를 나눌 수 있으니까
		int total = recService.getTotal();

		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		Recommend recommend = new Recommend();
		recommend.setStartRow(startRow);
		recommend.setEndRow(endRow);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		list = recService.getList(recommend);

//		for(int i=0; i<list.size(); i++) {
//			System.out.println("이름값 : " +list.get(i).get("REC_NAME"));
//		}

		model.addAttribute("list", list);
		model.addAttribute("page", pp);

		return "recommend/recommendList";
	}

	// 추천 게시판 상세 페이지로 이동
	@RequestMapping("/recommendDetail")
	public String recommendDetail(
	    @RequestParam("rec_no") int rec_no,
	    @RequestParam(value = "page", defaultValue = "1") String page,
	    												  Model model,
	    												  HttpSession session) {
	    // 조회수 업데이트
		recService.updatecount(rec_no);

	    // 추천 상세 정보 가져오기
	    Recommend recommend = recService.getBoard(rec_no);

	    String content = recommend.getRec_content().replace("\n", "<br>");
	    System.out.println(content);
	    
	    // 페이징 설정
	    if (page == null || page.equals("")) {
	    	page = "1";
	    }
	    int currentPage = Integer.parseInt(page);
	    int rowPerPage = 5;
	    int startRow = (currentPage - 1) * rowPerPage + 1;
	    int endRow = startRow + rowPerPage - 1;

	    // 해당 추천에 대한 댓글 총 개수 가져오기
	    int total = replyService.getReplyTotal(String.valueOf(rec_no));

	    // 페이징 정보 계산
	    PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

	    // 댓글 가져오기 위한 파라미터 설정
	    Reply reply = new Reply();
	    reply.setStartRow(startRow);
	    reply.setEndRow(endRow);
	    reply.setRec_no(rec_no);

	    // 댓글 목록 가져오기
	    List<Map<String, Object>> list = replyService.getReplyList(reply);

	    // 모델에 속성 추가
	    model.addAttribute("recommend", recommend);
	    model.addAttribute("content", content);
	    model.addAttribute("id", session.getAttribute("id"));
	    model.addAttribute("list", list);
	    model.addAttribute("page", pp);
	    model.addAttribute("rec_no",rec_no);
	    
	    return "recommend/recommendDetail";
	}


	
	// 추천 게시판 댓글 작성
	@RequestMapping("recommendReplyWrite")
	public String recommendReplyWrite( Reply reply, Model model, HttpSession session) {
		Reply check = replyService.replyCheck(reply);
		
	    if(check == null) {
		int result = replyService.insert(reply);
		
		model.addAttribute("reply", reply);
		model.addAttribute("result", result);
		
	    }else if(check != null){
	    	int result = replyService.reInsert(reply);
	    	model.addAttribute("result", result);
	    	
	    }
		return "recommend/replyInsertResult";
	}
	
	// 추천 게시판 댓글 삭제
	@RequestMapping("deleteReply")
	public String deleteReply(Reply reply, Model model, HttpSession session) {
		
		int result = 0;
	    
	    if(session.getAttribute("id").equals(reply.getMember_id())) {
	    	System.out.println("아이디 일치");
	    	result = replyService.deleteReply(reply.getReply_no());
	    }
	    System.out.println("result:" + result);
	    System.out.println("reply_no:" + reply.getReply_no());
	    
	    model.addAttribute("result", result);
	    model.addAttribute("rec_no", reply.getRec_no());	// result에서 디테일로 넘어갈 때 필요
		return "recommend/deleteReplyResult";
	}
	
	// 클라이언트 추천 게시판 작성
//	@RequestMapping("/recommendWrite")
//	public String g12() {
//		return "recommend/recommendWrite";
//	}

	// 클라이언트 추천 게시판 목록
//	@RequestMapping("/recommendContent")
//	public String g13() {
//		return "recommend/recommendContent";
//	}

	// 아이디 찾기
	@RequestMapping("/find_id")
	public String g14() {
		return "login/find_id";
	}

	// 비밀번호 찾기
	@RequestMapping("/find_pw")
	public String g15() {
		return "login/find_pw";
	}

	// 회원 문의 답변확인
	@RequestMapping("/inquiry_response")
	public String g16() {
		return "mypage/inquiry_response";
	}

}
