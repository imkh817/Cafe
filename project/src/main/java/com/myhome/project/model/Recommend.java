package com.myhome.project.model;

import java.sql.Date;

public class Recommend {
	int rec_no; /* 추천 게시판 번호 */
	String member_id; /* 회원아이디 */
	int rec_readcount; /* 조회수 */
	String rec_name; /* 추천 카페 이름 */
	String rec_image; /* 추천 카페 사진 */
	String rec_time1; /* 추천 카페 영업시간1 */
	String rec_time2; /* 추천 카페 영업시간2 */
	String rec_address; /* 추천 카페 주소 */
	String rec_menu1; /* 추천 카페 메뉴1 */
	String rec_menu2;/* 추천 카페 메뉴2 */
	String rec_menu3; /* 추천 카페 메뉴3 */
	String rec_number; /* 추천 카페 전화 */
	String rec_content; /* 추천 카페 설명 */
	Date rec_reg; /* 추천 카페 등록일 */
	
	// db에 없는 것 페이징을 위해 삽입
	int startRow;
	int endRow;
	
	
	
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
	public int getRec_no() {
		return rec_no;
	}
	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRec_readcount() {
		return rec_readcount;
	}
	public void setRec_readcount(int rec_readcount) {
		this.rec_readcount = rec_readcount;
	}
	public String getRec_name() {
		return rec_name;
	}
	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}
	public String getRec_image() {
		return rec_image;
	}
	public void setRec_image(String rec_image) {
		this.rec_image = rec_image;
	}
	public String getRec_time1() {
		return rec_time1;
	}
	public void setRec_time1(String rec_time1) {
		this.rec_time1 = rec_time1;
	}
	public String getRec_time2() {
		return rec_time2;
	}
	public void setRec_time2(String rec_time2) {
		this.rec_time2 = rec_time2;
	}
	public String getRec_address() {
		return rec_address;
	}
	public void setRec_address(String rec_address) {
		this.rec_address = rec_address;
	}
	public String getRec_menu1() {
		return rec_menu1;
	}
	public void setRec_menu1(String rec_menu1) {
		this.rec_menu1 = rec_menu1;
	}
	public String getRec_menu2() {
		return rec_menu2;
	}
	public void setRec_menu2(String rec_menu2) {
		this.rec_menu2 = rec_menu2;
	}
	public String getRec_menu3() {
		return rec_menu3;
	}
	public void setRec_menu3(String rec_menu3) {
		this.rec_menu3 = rec_menu3;
	}
	public String getRec_number() {
		return rec_number;
	}
	public void setRec_number(String rec_number) {
		this.rec_number = rec_number;
	}
	public String getRec_content() {
		return rec_content;
	}
	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}
	public Date getRec_reg() {
		return rec_reg;
	}
	public void setRec_reg(Date rec_reg) {
		this.rec_reg = rec_reg;
	}
	
	
	
}
