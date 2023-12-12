package com.myhome.project.model;

import java.sql.Date;

import lombok.Data;

@Data
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
	
	
}
