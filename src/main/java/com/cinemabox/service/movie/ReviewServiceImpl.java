package com.cinemabox.service.movie;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.movie.ReviewDao;
import com.cinemabox.vo.Review;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired ReviewDao reviewDao;

	@Override
	public void insertReview(Review review) {
		//로그인한 사용자 가져오기
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");

		//리뷰 추가하기
		Review comment = new Review();
		comment.setContent(review.getContent());
		comment.setRating(review.getRating());
		comment.setUserId(loginedUser.getId());
		comment.setMovieNo(review.getMovieNo());
		
		reviewDao.insertReview(comment);
	}
	
	@Override
	public void deleteReview(Review review) {
		reviewDao.deleteReview(review);
	}
	
	@Override
	public List<Review> getAllReviews(int movieNo) {
		return reviewDao.getAllReviews(movieNo);
	}
	
	@Override
	public Review getReviewByUserId(Map<String, Object> map) {
		return reviewDao.getReviewByUserId(map);
	}
}
