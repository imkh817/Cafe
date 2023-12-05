package com.myhome.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Member;

@Mapper
public interface MemberDao {

	int insert(Member member);
	
	Member idCheck(String id);

	Member nicknameCheck(String nickname);

}
