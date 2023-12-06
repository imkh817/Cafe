package com.myhome.project.model;

import java.sql.Date;

public class Review {
	
	private int review_no; /* 리뷰 번호 */
	private String member_id; /* 회원아이디 */
	private int cafe_no; /* 카페번호 */
	private int hash_no; /* 해시태그 번호 */
	private String review_content; /* 리뷰 내용 */
	private int cafe_star; /* 별점 */
	private Date review_reg;  /* 리뷰 작성일 */
	private int startRow;
	private int endRow;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCafe_no() {
		return cafe_no;
	}
	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}
	public int getHash_no() {
		return hash_no;
	}
	public void setHash_no(int hash_no) {
		this.hash_no = hash_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getCafe_star() {
		return cafe_star;
	}
	public void setCafe_star(int cafe_star) {
		this.cafe_star = cafe_star;
	}
	public Date getReview_reg() {
		return review_reg;
	}
	public void setReview_reg(Date review_reg) {
		this.review_reg = review_reg;
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
	
	

	
}
