package com.myhome.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.project.model.Review;

@Mapper
public interface ReviewDao {


	List<Map<String, Object>> reviewPagingList(Review review);

	int getTotalReviewCount(String id);

	int deleteReview(String review_no);

}