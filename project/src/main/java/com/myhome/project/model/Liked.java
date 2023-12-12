package com.myhome.project.model;

import lombok.Data;

@Data
public class Liked {
	public String member_id; /* 회원아이디 */
	public int cafe_no; /* 카페번호 */

//	page
	private int startRow;
	private int endRow;
	
	
}
