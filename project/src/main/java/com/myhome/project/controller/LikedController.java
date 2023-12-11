package com.myhome.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myhome.project.model.Liked;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.service.LikedService;

@Controller
public class LikedController {

	@Autowired
	public LikedService likedService;

//	찜목록 이동
	@RequestMapping("/liked")
	public String likedList(Liked liked, String pageNum, HttpSession session, Model model) {

		liked.setMember_id((String) session.getAttribute("id"));

		List<Map<String, Object>> likedResult = likedService.getLikedListByNo(liked);

		model.addAttribute("likedResult", likedResult);
		System.out.println("likedResult" + likedResult);
		model.addAttribute("liked", liked);

//		페이징
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}

		int curruntPage = Integer.parseInt(pageNum);

		int total = likedService.getTotal(liked);
		int rowPerPage = 6;

		int startRow = (curruntPage - 1) * rowPerPage;
		int endRow = startRow + rowPerPage - 1;

		liked.setStartRow(startRow);
		liked.setEndRow(endRow);

		PagingPgm pp = new PagingPgm(total, rowPerPage, curruntPage);

		model.addAttribute("pp", pp);
		model.addAttribute("pageNum", pageNum);

		return "mypage/liked";

	}

//	지금 바로 확인하기 버튼 클릭 및 카페 이름 클릭 이동
	@RequestMapping("/moveDetail")
	public String likedToDetail(@RequestParam int cafe_no, Model model) {
		List<Liked> likedDetail = likedService.moveLikedToDetail(cafe_no);

		model.addAttribute("likedDetail", likedDetail);

		System.out.println("likedDetail :" + likedDetail);

		return "cafe/detail";
	}

}
