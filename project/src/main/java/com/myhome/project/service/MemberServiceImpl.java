package com.myhome.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.MemberDao;
import com.myhome.project.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao dao;

	@Override
	public int insert(Member member) {
		
		return dao.insert(member);
	}

	@Override
	public int idCheck(String id) {
		
		Member member = dao.idCheck(id);
		
		int result = -1;
		if(member != null) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public int nicknameCheck(String nickname) {
		Member member = dao.nicknameCheck(nickname);
		
		int result = -1;
		if(member != null) {
			result = 1;
		}
		return result;
	}
	
	
}