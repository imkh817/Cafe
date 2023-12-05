package com.myhome.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myhome.project.model.Member;
import com.myhome.project.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	// 회원가입
	@RequestMapping("joinMember")
	public String join(@ModelAttribute Member member, Model model) {
		System.out.println("member_id : " + member.getMember_id());
		int result = service.insert(member);
		model.addAttribute("result",result);
		
		return "login/join_result";
	}
	// ID 중복검사
	@RequestMapping("member_idCheck")
	public String idCheck(String id,Model model) {
		int result = service.idCheck(id);
		
		model.addAttribute("result",result);
		
		return "login/id_check";
	}
	
	// 닉네임 중복검사
	@RequestMapping("member_nicknameCheck")
	public String nicknameCheck(String nickname,Model model) {
		int result = service.nicknameCheck(nickname);
		
		model.addAttribute("result",result);
		
		return "login/nickname_check";
	}
}
