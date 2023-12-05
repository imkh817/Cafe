package com.myhome.project.model;

import java.sql.Date;

public class Reply {
	
	int reply_no; /* 댓글 번호 */
	int rec_no; /* 추천 게시판 번호 */
	String reply_content; /* 추천 리뷰 내용 */
	Date reply_reg; /* 추천 작성일 */
	int reply_ref; /* ref */
	int reply_step; /* step */
	int reply_level;/* level */
}
