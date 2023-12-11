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

	// 리뷰 작성
	int review_insert(Review review);

	List<Map<String, Object>> review_list(Review review);

	int review_total(Review review);

	// cafe_avg 구해오기
	double avg_star(int cafe_no);
	
	// 해시태그 평균 값
    List<Map<String, Object>> hash_avg(Review review);
    
    // 별점 평균 값
    double starAvg(int cafe_no);
	
	
	
	
}
