package com.myhome.project.service;

import com.myhome.project.model.Response;

public interface ResponseService {
	// 관리자 - 답변 작성
		int insertResponse(Response response);
		
		public int updateResponse(Response response);
		
		// 관리자 - 문의한 사람의 답변상태 변경
		void updateResponseState(int inquiry_no);

		
		Response getResponse(String inquiry_no);

		int checkResponse(int inquiry_no);
}
