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
}
