package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Reply;

public interface ReplyService {


	List<Map<String, Object>> getReplyList(Reply reply);

	int insert(Reply reply);

	int getReplyTotal(String rec_no);

	int reInsert(Reply reply);

	Reply replyCheck(Reply reply);

	int deleteReply(Reply reply);


}
