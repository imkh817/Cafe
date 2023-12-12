package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Recommend {
	private int rec_no; /* 추천 게시판 번호 */
	private String member_id; /* 회원아이디 */
	private int rec_readcount; /* 조회수 */
	private String rec_name; /* 추천 카페 이름 */
	private String rec_image; /* 추천 카페 사진 */
	private String rec_time1; /* 추천 카페 영업시간1 */
	private String rec_time2; /* 추천 카페 영업시간2 */
	private String rec_address; /* 추천 카페 주소 */
	private String rec_menu1; /* 추천 카페 메뉴1 */
	private String rec_menu2;/* 추천 카페 메뉴2 */
	private String rec_menu3; /* 추천 카페 메뉴3 */
	private String rec_number; /* 추천 카페 전화 */
	private String rec_content; /* 추천 카페 설명 */
	private Date rec_reg; /* 추천 카페 등록일 */
	
	// db에 없는 것 페이징을 위해 삽입
	private int startRow;
	private int endRow;
	
	
}
