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
	String member_id;
	
	// table에는 없습니다.
	int startRow;
	int endRow;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getRec_no() {
		return rec_no;
	}
	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_reg() {
		return reply_reg;
	}
	public void setReply_reg(Date reply_reg) {
		this.reply_reg = reply_reg;
	}
	public int getReply_ref() {
		return reply_ref;
	}
	public void setReply_ref(int reply_ref) {
		this.reply_ref = reply_ref;
	}
	public int getReply_step() {
		return reply_step;
	}
	public void setReply_step(int reply_step) {
		this.reply_step = reply_step;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
