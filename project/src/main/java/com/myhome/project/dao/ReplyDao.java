package com.myhome.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Reply;

@Mapper
public interface ReplyDao {


	List<Map<String, Object>> getReplyList(Reply reply);

	int insert(Reply reply);

	int getReplyTotal(String rec_no);

	int reInsert(Reply reply);

	Reply replyCheck(Reply reply);

	int deleteReply(int reply_no);

}
