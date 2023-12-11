package com.myhome.project.service;

import com.myhome.project.model.Member;

public interface MemberService {

	int insert(Member member);

	int idCheck(String id);
	
	int nicknameCheck(String nickname);

	// 자체 로그인
	Member userCheck(String id);

	int memberUpdateOk(Member member);

	Member getMember(String id);

	Member findId(Member member);

	Member findpw(Member member);

	Member emailCheck(Member member);
	
	void pwUpdate(Member member);
	
	void memberDelete(Member member);

	// 카카오
	int insertKakao(Member member);
	
	Member KakaoUserCheck(String member_id);
	
	Member isLogin(String id, String pw);





	


}
