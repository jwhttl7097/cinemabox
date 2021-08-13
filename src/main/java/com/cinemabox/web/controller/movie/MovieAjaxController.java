package com.cinemabox.web.controller.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.service.movie.MovieService;
import com.cinemabox.service.movie.ReviewService;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;

@Controller
@RequestMapping("/boxoffice")
public class MovieAjaxController {

	@Autowired MovieService movieService;
	@Autowired ReviewService reviewService;
	
	@RequestMapping("/sort")
	public @ResponseBody ResponseEntity<Map<String, Object>> nowMovieList(String sort){
		List<Movie> nowMovieList = movieService.getNowMovieList(sort);
		List<Movie> unreleasedMovieList = movieService.getUnreleasedMovieList(sort);
		Map<String, Object> map = new HashMap<>();
		map.put("nowMovieList", nowMovieList);
		map.put("unreleasedMovieList",unreleasedMovieList);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping("/review")
	public @ResponseBody ResponseEntity<List<Review>> addReview(Review review, int movieNo){
		reviewService.insertReview(review);
		
		List<Review> reviewList = reviewService.getAllReviews(movieNo);
		
		return new ResponseEntity<List<Review>>(reviewList, HttpStatus.OK);
	}
}
