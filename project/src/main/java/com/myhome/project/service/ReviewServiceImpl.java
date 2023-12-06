package com.myhome.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.ReviewDao;
import com.myhome.project.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDao dao;

	@Override
	public List<Map<String, Object>> reviewPagingList(Review review) {
		return dao.reviewPagingList(review);
	}

	@Override
	public int getTotalReviewCount(String id) {
		return dao.getTotalReviewCount(id);
	}

	@Override
	public int deleteReview(String review_no) {
		return dao.deleteReview(review_no);
	}

}
