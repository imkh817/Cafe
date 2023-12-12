package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
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


}
