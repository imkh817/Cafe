package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Review;

public interface ReviewService {

	List<Map<String, Object>> reviewPagingList(Review review);
	int getTotalReviewCount(String id);
	int deleteReview(String review_no);
	
	// 리뷰 작성
	int review_insert(Review review);

	// 리뷰 목록
	List<Map<String, Object>> review_list(Review review);

	// 리뷰 총 갯수
	int getTotal(Review review);

	// 카페 별점 평균값 구해오기
	double avg_star(int cafe_no);
}
