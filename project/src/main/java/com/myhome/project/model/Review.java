package com.myhome.project.model;

import java.sql.Date;

public class Review {
	
	int review_no; /* 리뷰 번호 */
	String member_id; /* 회원아이디 */
	int cafe_no; /* 카페번호 */
	int hash_no; /* 해시태그 번호 */
	String review_content; /* 리뷰 내용 */
	int cafe_star; /* 별점 */
	Date review_reg; /* 리뷰 작성일 */

}
