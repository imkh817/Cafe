package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import com.myhome.project.model.Review;

public interface ReviewService {

	List<Map<String, Object>> reviewPagingList(Review review);
	int getTotalReviewCount(String id);
	int deleteReview(String review_no);
}
