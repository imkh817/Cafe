package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Response {
	private int response_no; /* 문의답변 번호 */
	private int inquiry_no; /* 문의 게시판 번호 */
	private String response_content; /* 문의 답변 내용 */
	private String response_title; /* 문의 답변 내용 */
	private Date response_reg;/* 문의 답변 날짜 */
	
	private int startRow;
	private int endRow;
	
	
}
