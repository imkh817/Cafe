package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int reply_no; /* 댓글 번호 */
	private int rec_no; /* 추천 게시판 번호 */
	private String reply_content; /* 추천 리뷰 내용 */
	private Date reply_reg; /* 추천 작성일 */
	private int reply_ref; /* ref */
	private int reply_step; /* step */
	private int reply_level;/* level */
	private String member_id;
	
	// table에는 없습니다.
	private int startRow;
	private int endRow;
	
	
}
