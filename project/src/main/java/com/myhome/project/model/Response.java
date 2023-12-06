package com.myhome.project.model;

import java.sql.Date;

public class Response {
	int response_no; /* 문의답변 번호 */
	int inquiry_no; /* 문의 게시판 번호 */
	String response_content; /* 문의 답변 내용 */
	String response_title; /* 문의 답변 내용 */
	Date response_reg;/* 문의 답변 날짜 */
	
	int startRow;
	int endRow;
	public int getResponse_no() {
		return response_no;
	}
	public void setResponse_no(int response_no) {
		this.response_no = response_no;
	}
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
	public String getResponse_content() {
		return response_content;
	}
	public void setResponse_content(String response_content) {
		this.response_content = response_content;
	}
	public String getResponse_title() {
		return response_title;
	}
	public void setResponse_title(String response_title) {
		this.response_title = response_title;
	}
	public Date getResponse_reg() {
		return response_reg;
	}
	public void setResponse_reg(Date response_reg) {
		this.response_reg = response_reg;
	}
	
	
}
