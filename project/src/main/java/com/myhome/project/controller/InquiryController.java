package com.myhome.project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.project.model.Inquiry;
import com.myhome.project.model.PagingPgm;
import com.myhome.project.service.InquiryService;

@Controller
public class InquiryController {

	@Autowired
	public InquiryService inquiryService;

// 	문의페이지 이동 및 문의목록 조회
	@RequestMapping("/inquiry")
	public String inquiryList(Inquiry inquiry, String pageNum, HttpSession session, Model model) {

		inquiry.setMember_id((String) session.getAttribute("id"));

		List<Inquiry> inquiryList = inquiryService.inquiryList(inquiry);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("inquiry", inquiry);

//		페이징

		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}

		int curruntPage = Integer.parseInt(pageNum);

		String id = (String) session.getAttribute("id");

		int total = inquiryService.getTotal(id);
		int rowPerPage = 10;

		int startRow = (curruntPage - 1) * rowPerPage;
		int endRow = startRow + rowPerPage - 1;

		inquiry.setStartRow(startRow);
		inquiry.setEndRow(endRow);

		PagingPgm pp = new PagingPgm(total, rowPerPage, curruntPage);

		model.addAttribute("pp", pp);
		model.addAttribute("pageNum", pageNum);

		session.setAttribute("pageNum", pageNum);

		return "mypage/inquiry";
	}

//	문의 제출
	@RequestMapping(value = "/inquiry_submit")
	public String submitInquiry(Inquiry inquiry, HttpSession session,
			@RequestParam(name = "imageUpload") MultipartFile imageUpload, HttpServletRequest request, Model model) {

//		첨부파일
		String filename = imageUpload.getOriginalFilename();
		int size = (int) imageUpload.getSize();
		inquiry.setInquiry_image(filename);

		System.out.println("filename : " + filename);
		System.out.println("size : " + size);
		System.out.println("inquiry img : " + inquiry.getInquiry_image());

		String pathDir = request.getRealPath("/upload/");
		System.out.println("pathDir : " + pathDir);

		try {
			// 업로드된 파일을 저장할 경로
			Path uploadPath = Paths.get(pathDir);

			// 파일 저장
			byte[] bytes = imageUpload.getBytes();
			Path filePath = uploadPath.resolve(imageUpload.getOriginalFilename());
			Files.write(filePath, bytes);

		} catch (IOException e) {
			e.printStackTrace();
		}

		String member_id = (String) session.getAttribute("member_id");
		String pageNum = (String) session.getAttribute("pageNum");

		System.out.println("member_id" + member_id);
		System.out.println("pageNum" + pageNum);

		int result = inquiryService.submitInquiry(inquiry);

		model.addAttribute("result", result);

		return "mypage/inquirySubmitCheck";

	}

// 	문의 상세페이지로 이동
	@RequestMapping("/inquiry_detail")
	public String detailInquiry(Inquiry inquiry, HttpSession session, Model model) {

		String member_id = (String) session.getAttribute("member_id");
		String pageNum = (String) session.getAttribute("pageNum");

		List<Map<Integer, Object>> inquiryDetailList = inquiryService.detailInquiry(inquiry);

		model.addAttribute("inquiryDetailList", inquiryDetailList);
		System.out.println("inquiryDetailList : " + inquiryDetailList);

		return "mypage/inquiry_detail";
	}

	// 문의 상세페이지에서 수정
	@RequestMapping("/inquiry_update")
	public String updateInquiry(Inquiry inquiry, @RequestParam(name = "imageUpload") MultipartFile imageUpload,
			HttpSession session, HttpServletRequest request, Model model) {

		String member_id = (String) session.getAttribute("member_id");

		inquiry.setMember_id(member_id);
		System.out.println("member_id: " + inquiry.getMember_id());

		String pageNum = (String) session.getAttribute("pageNum");
		model.addAttribute("pageNum", pageNum);

//		첨부파일
		String filename = imageUpload.getOriginalFilename(); // 첨부파일명
		int size = (int) imageUpload.getSize(); // 첨부파일의 크기 (단위:Byte)

		String path = request.getRealPath("upload");
		System.out.println("imageUpload : " + imageUpload);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);

		String file[] = new String[2];
		String newfilename = inquiry.getInquiry_image();

		if (filename != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());

			System.out.println("extension:" + extension);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명 Koala
			file[1] = st.nextToken(); // 확장자 jpg

			newfilename = file[0] + extension;
			System.out.println("newfilename: " + newfilename);
		}

		Inquiry edited = this.inquiryService.noCheck(inquiry.getInquiry_no());
		System.out.println("edit inquiry_no" + inquiry.getInquiry_no());

		if (size > 0) { // 첨부파일이 전송된 경우
			try {
				imageUpload.transferTo(new File(path + "/" + newfilename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (size > 0) {
			inquiry.setInquiry_image(newfilename);
		} else {
			inquiry.setInquiry_image(edited.getInquiry_image());
		}

		// updateInquiry 메소드 호출

		int updateResult = inquiryService.updateInquiry(inquiry);
		model.addAttribute("updateResult", updateResult);
		System.out.println("updateResult: " + updateResult);
		System.out.println("imageUpload : " + imageUpload);

		return "mypage/inquiryUpdateCheck";
	}

//	문의 삭제
	@RequestMapping("/inquiry_delete")
	public String deleteInquiry(Inquiry inquiry, HttpSession session, Model model) {

		inquiry.setMember_id((String) session.getAttribute("member_id"));
		String pageNum = (String) session.getAttribute("pageNum");

		int deleteResult = inquiryService.deleteInquiry(inquiry);

		model.addAttribute("deleteResult", deleteResult);
		model.addAttribute("pageNum", pageNum);

		return "mypage/inquiryDeleteCheck";
	}

}
