package com.cinemabox.dao.movie;

import java.util.List;
import java.util.Map;

import com.cinemabox.vo.Review;

public interface ReviewDao {

	void insertReview(Review review);
	void deleteReview(Review review);
	List<Review> getAllReviews(int movieNo);
	Review getReviewByUserId(Map<String, Object> map);
}
