package com.myhome.project.model;

import lombok.Data;

@Data
public class Member {

	private String member_id; /* 회원 아이디 */
	private String member_pw; /* 비밀번호 */
	private String member_name; /* 이름 */
	private String member_jumin1; /* 주민번호1 */
	private String member_jumin2; /* 주민번호2 */
	private String member_nickname; /* 닉네임 */
	private String member_phone1; /* 핸드폰번호1 */
	private String member_phone2;/* 핸드폰번호2  */
	private String member_phone3; /* 핸드폰번호3 */
	private String member_post; /* 우편번호 */
	private String member_address1; /* 주소 */
	private String member_address2; /* 상세 주소 */
	private String member_email; /* 이메일  */
	private String member_domain; /* 도메인  */
	private String member_state;/* 회원 상태(탈퇴유무) */
	private String social_state; // 소설로그인 상태 여부 확인
	
	
	
	
}
