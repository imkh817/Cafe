package com.myhome.project.model;

import lombok.Data;

@Data
public class Liked {
	private String member_id; /* 회원아이디 */
	private int cafe_no; /* 카페번호 */

//	page
	private int startRow;
	private int endRow;
	
	
}
