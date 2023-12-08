package com.myhome.project.model;

import java.sql.Date;

public class Inquiry {

	/* 문의 */
	private int inquiry_no; /* 문의 게시판 번호 */
	private String member_id; /* 회원아이디 */
	private String inquiry_title; /* 문의 제목 */
	private String inquiry_content; /* 문의 내용 */
	private String inquiry_image; /* 문의 사진 */
	private Date inquiry_reg; /* 문의 날짜 */
	private String response_state; /* 문의 답변 여부 */

//	page
	private int startRow;
	private int endRow;

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_image() {
		return inquiry_image;
	}

	public void setInquiry_image(String inquiry_image) {
		this.inquiry_image = inquiry_image;
	}

	public Date getInquiry_reg() {
		return inquiry_reg;
	}

	public void setInquiry_reg(Date inquiry_reg) {
		this.inquiry_reg = inquiry_reg;
	}

	public String getResponse_state() {
		return response_state;
	}

	public void setResponse_state(String response_state) {
		this.response_state = response_state;
	}

//	public MultipartFile getImageFile() {
//		return imageFile;
//	}
//
//	public void setImageFile(MultipartFile imageFile) {
//		this.imageFile = imageFile;
//	}

}
