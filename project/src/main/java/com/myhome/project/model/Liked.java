package com.myhome.project.model;

public class Liked {
	private String member_id; /* 회원아이디 */
	private int cafe_no; /* 카페번호 */
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
}
