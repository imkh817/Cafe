package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Cafe {
	
	private int cafe_no; /* 카페번호 */
	private int category_no; /* 카테고리 번호 */
	private int cafe_readcount;/* 조회수 */
	private String cafe_name; /* 카페 이름 */
	private String cafe_image;/* 카페 사진 */
	private String cafe_time1; /* 영업시간1 */
	private String cafe_time2; /* 영업시간2 */
	private String cafe_number; /* 카페전화 */
	private String cafe_address; /* 카페주소 */
	private Date cafe_reg;/* 카페등록일 */
	private String cafe_menu1; /* 메뉴1 */
	private String cafe_menu2; /* 메뉴2 */
	private String cafe_menu3;/* 메뉴3 */
	private String cafe_comment;
	private double avg_cafe_star;
	
	// 페이징
	private int startRow;
	private int endRow;
	
	// 검색
	private String keyword;
	
	// 위치 API에서 받아온 사용자 위치 주소값
	private String nearByCafe;
	
	
	
	
	
	
}
