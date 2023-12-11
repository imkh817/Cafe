package com.myhome.project.model;

import java.sql.Date;

public class Cafe {
	
	int cafe_no; /* 카페번호 */
	int category_no; /* 카테고리 번호 */
	int cafe_readcount;/* 조회수 */
	String cafe_name; /* 카페 이름 */
	String cafe_image;/* 카페 사진 */
	String cafe_time1; /* 영업시간1 */
	String cafe_time2; /* 영업시간2 */
	String cafe_number; /* 카페전화 */
	String cafe_address; /* 카페주소 */
	Date cafe_reg;/* 카페등록일 */
	String cafe_menu1; /* 메뉴1 */
	String cafe_menu2; /* 메뉴2 */
	String cafe_menu3;/* 메뉴3 */
	String cafe_comment;
	double avg_cafe_star;
	
	// 페이징
	private int startRow;
	private int endRow;
	
	// 검색
	private String keyword;
	
	// 위치 API에서 받아온 사용자 위치 주소값
	private String nearByCafe;
	
	public String getNearByCafe() {
		return nearByCafe;
	}
	public void setNearByCafe(String nearByCafe) {
		this.nearByCafe = nearByCafe;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	public int getCafe_no() {
		return cafe_no;
	}
	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getCafe_readcount() {
		return cafe_readcount;
	}
	public void setCafe_readcount(int cafe_readcount) {
		this.cafe_readcount = cafe_readcount;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_image() {
		return cafe_image;
	}
	public void setCafe_image(String cafe_image) {
		this.cafe_image = cafe_image;
	}
	public String getCafe_time1() {
		return cafe_time1;
	}
	public void setCafe_time1(String cafe_time1) {
		this.cafe_time1 = cafe_time1;
	}
	public String getCafe_time2() {
		return cafe_time2;
	}
	public void setCafe_time2(String cafe_time2) {
		this.cafe_time2 = cafe_time2;
	}
	public String getCafe_number() {
		return cafe_number;
	}
	public void setCafe_number(String cafe_number) {
		this.cafe_number = cafe_number;
	}
	public String getCafe_address() {
		return cafe_address;
	}
	public void setCafe_address(String cafe_address) {
		this.cafe_address = cafe_address;
	}
	public Date getCafe_reg() {
		return cafe_reg;
	}
	public void setCafe_reg(Date cafe_reg) {
		this.cafe_reg = cafe_reg;
	}
	public String getCafe_menu1() {
		return cafe_menu1;
	}
	public void setCafe_menu1(String cafe_menu1) {
		this.cafe_menu1 = cafe_menu1;
	}
	public String getCafe_menu2() {
		return cafe_menu2;
	}
	public void setCafe_menu2(String cafe_menu2) {
		this.cafe_menu2 = cafe_menu2;
	}
	public String getCafe_menu3() {
		return cafe_menu3;
	}
	public void setCafe_menu3(String cafe_menu3) {
		this.cafe_menu3 = cafe_menu3;
	}
	public String getCafe_comment() {
		return cafe_comment;
	}
	public void setCafe_comment(String cafe_comment) {
		this.cafe_comment = cafe_comment;
	}
	public double getAvg_cafe_star() {
		return avg_cafe_star;
	}
	public void setAvg_cafe_star(double avg_cafe_star) {
		this.avg_cafe_star = avg_cafe_star;
	}
	
	
	
	
}
