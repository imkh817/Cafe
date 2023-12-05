package com.myhome.project.service;

import com.myhome.project.model.Member;

public interface MemberService {

	int insert(Member member);

	int idCheck(String id);
	
	int nicknameCheck(String nickname);

}
