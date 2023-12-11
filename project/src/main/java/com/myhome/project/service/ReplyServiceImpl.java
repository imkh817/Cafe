package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.ReplyDao;
import com.myhome.project.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDao dao;


	@Override
	public List<Map<String, Object>> getReplyList(Reply reply) {
		return dao.getReplyList(reply);
	}


	@Override
	public int insert(Reply reply) {
		return dao.insert(reply);
	}


	@Override
	public int getReplyTotal(String rec_no) {
		return dao.getReplyTotal(rec_no);
	}


	@Override
	public int reInsert(Reply reply) {
		return dao.reInsert(reply);
	}

    @Override
	public Reply replyCheck(Reply reply) {
		return dao.replyCheck(reply);
	}


	@Override
	public int deleteReply(int reply_no) {
		return dao.deleteReply(reply_no);
	}



}
