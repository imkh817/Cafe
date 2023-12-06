package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myhome.project.model.Category;
import com.myhome.project.model.Member;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.model.Recommend;
import com.myhome.project.model.Reply;
import com.myhome.project.service.CategoryService;
import com.myhome.project.service.MemberService;
import com.myhome.project.service.RecommendService;
import com.myhome.project.service.ReplyService;

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
		List<Category> list = new ArrayList<Category>();
		list = categoryService.selectList();
		
		String id = (String)session.getAttribute("id");
		System.out.println("session에 저장된 id : " + id);
		
		model.addAttribute("list",list);
		model.addAttribute("id",id);
		return "cafe/main";
	}

	// 목록 페이지로 이동
	@RequestMapping("/list")
	public String g2() {
		return "cafe/list";
	}

	// 상세 페이지로 이동
	@RequestMapping("/detail")
	public String g3(String cate, Model model) {
		return "cafe/detail";
	}

	// 리뷰
	@RequestMapping("/hashtag_result")
	public String g4() {
		return "cafe/hashtag_result";
	}

	// 하트
	@RequestMapping("/heart_result")
	public String g5() {
		return "cafe/heart_result";
	}

	// 회원가입
	@RequestMapping("/join")
	public String gg6() {
		return "login/join";
	}

	// 마이페이지 찜
	@RequestMapping("/dibs")
	public String g6() {
		return "mypage/dibs";
	}

	// 마이페이지 정보수정
	@RequestMapping("/memberupdate")
	public String g8() {
		return "mypage/memberupdate";
	}

	// 마이페이지 1대1문의
	@RequestMapping("/inquiry")
	public String g9() {
		return "mypage/inquiry";
	}

	// 마이페이지 회원탈퇴
	@RequestMapping("/quit")
	public String gg9() {
		return "mypage/quit";
	}

	// 관리자 회원관리
	@RequestMapping("/manage")
	public String ggg9() {
		return "admin/manage";
	}

	// 관리자 장소등록
	@RequestMapping("/newPlace")
	public String ggg1() {
		return "admin/newPlace";
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
	public String recommendDetail(String page, Model model, HttpSession session,String rec_no) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		int currentPage = Integer.parseInt(page);
		int rowPerPage = 5;
		int startRow = (currentPage - 1) * rowPerPage + 1; // 1, 6, 11...
		int endRow = startRow + rowPerPage - 1; // 5, 10, 15...

		int total = replyService.getReplyTotal(rec_no);

		System.out.println("total : " + total);
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		Reply reply = new Reply();
		reply.setStartRow(startRow);
		reply.setEndRow(endRow);
		reply.setRec_no(Integer.parseInt(rec_no));

		System.out.println("rec_no : " + rec_no);
		System.out.println("reply 1: " + reply.getStartRow());
		System.out.println("reply 2: " + reply.getEndRow());

		// 조인 안 했을 때는 Map없이 list로만 쓸 수 있다.		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = replyService.getReplyList(reply);		
		
		model.addAttribute("id", session.getAttribute("id"));
		model.addAttribute("list", list);
		model.addAttribute("page", pp);
		model.addAttribute("rec_no", rec_no);

		return "recommend/recommendDetail";
	}
	
	// 추천 게시판 댓글 작성
	@RequestMapping("recommendReplyWrite")
	public String recommendReplyWrite( Reply reply, Model model, HttpSession session) {
		Reply check = replyService.replyCheck(reply);
		
	    if(check == null) {
		int result = replyService.insert(reply);
		
		model.addAttribute("result", result);
		model.addAttribute("reply", reply);
		
	    }else if(check != null){
	    	int result = replyService.reInsert(reply);
	    	
//	    // ref, level, step 처리
//	    	reply.setReply_level(reply.getReply_level() + 1); // 부모보다 1증가된 값
//	    	reply.setReply_step(reply.getReply_step() + 1); 
//	    	
//			model.addAttribute("reply", reply);
//			model.addAttribute("result", result);
	    }
		return "recommend/replyInsertResult";
	}
	
	// 추천 게시판 댓글 삭제
	@RequestMapping("deleteReply")
	public String deleteReply(Reply reply, Model model, HttpSession session) {
		// session.getAttribute("id");
	    if(session.getAttribute("id").equals(reply.getMember_id())) {
	    	System.out.println("아이디 일치");
	    	int result = replyService.deleteReply(reply);
	    	System.out.println("result:" + result);
	    	model.addAttribute("result", result);
	    }
		return "recommend/deleteReplyResult";
	}

	
	// 클라이언트 추천 게시판 작성
	@RequestMapping("/recommendWrite")
	public String g12() {
		return "recommend/recommendWrite";
	}

	// 클라이언트 추천 게시판 목록
	@RequestMapping("/recommendContent")
	public String g13() {
		return "recommend/recommendContent";
	}

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
