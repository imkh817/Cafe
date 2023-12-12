package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Response {
	int response_no; /* 문의답변 번호 */
	int inquiry_no; /* 문의 게시판 번호 */
	String response_content; /* 문의 답변 내용 */
	String response_title; /* 문의 답변 내용 */
	Date response_reg;/* 문의 답변 날짜 */
	
	int startRow;
	int endRow;
	
	
}
