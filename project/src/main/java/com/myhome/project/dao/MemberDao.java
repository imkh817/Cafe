package com.myhome.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Member;

@Mapper
public interface MemberDao {

	int insert(Member member);
	
	Member idCheck(String id);

	Member nicknameCheck(String nickname);

    Member userCheck(String id);

	int memberUpdateOk(Member member);

	Member getMember(String id);

	Member findId(Member member);
	
	Member findpw(Member member);
	
	Member emailCheck(Member member);	// 비번 찾기 - 아이디랑 이메일 체크
	
	void pwUpdate(Member member);		// 임시 비밀번호로 비번 수정
	
	void memberDelete(Member member);

	// kakao
	int insertKakao(Member member);

	Member KakaoUserCheck(String member_id);

	Member isLogin(String id, String pw);



	
}
