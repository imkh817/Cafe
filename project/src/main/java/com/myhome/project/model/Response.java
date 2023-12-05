package com.myhome.project.model;

import java.sql.Date;

public class Response {
	int response_no; /* 문의답변 번호 */
	int ask_no; /* 문의 게시판 번호 */
	String inquiry_response; /* 문의 답변 내용 */
	Date inquiry_reg;/* 문의 답변 날짜 */
}
