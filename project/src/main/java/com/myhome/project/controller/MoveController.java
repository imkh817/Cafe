package com.myhome.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhome.project.model.Category;
import com.myhome.project.service.IncludeListService;

@Controller
public class MoveController {
	
	@Autowired
	IncludeListService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping("/header")
	public String go() {
		return "include/header";
	}
	
	
	
	// 메인 페이지로 이동
	@RequestMapping("/mainlist")
	public String goMain(Model model) {
		
		List<Category> list = new ArrayList<Category>();
		list = service.selectList();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getCategory_name());
		}
		model.addAttribute("list",list);
		
		return "cafe/main";
	}
	
	// 목록 페이지로 이동
	@RequestMapping("/list")
	public String g2() {
		return "cafe/list";
	}
	
	// 상세 페이지로 이동
	@RequestMapping("/detail")
	public String g3(String cate,Model model) {
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
	
	// 마이페이지 리뷰관리
	@RequestMapping("/myReview")
	public String g7() {
		return "mypage/myReview";
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
	@RequestMapping("/clientRecommend")
	public String g10() {
		return "recommend/clientRecommend";
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
		return "login/find_idpw";
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
	
	// 관리자 1:1문의
	@RequestMapping("/adminInquiry")
	public String g17() {
		return "admin/adminInquiry";
	}
	
	// 관리자 1:1문의 답변
	@RequestMapping("/adminInquiry_response")
	public String g18() {
		return "admin/adminInquiry_response";
	}
}
