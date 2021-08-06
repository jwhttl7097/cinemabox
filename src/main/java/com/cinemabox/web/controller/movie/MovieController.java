package com.cinemabox.web.controller.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinemabox.service.movie.MovieService;
import com.cinemabox.vo.Movie;

@Controller
public class MovieController{
	
	@Autowired MovieService movieService;
	
	@GetMapping(path = {"/movie"})
	public String boxoffice(Model model, String sort) {
		List<Movie> nowMovies = movieService.getNowMovieList(sort);
		List<Movie> unreleased = movieService.getUnreleasedMovieList(sort);
		model.addAttribute("nowMovies", nowMovies);
		model.addAttribute("unreleased", unreleased);
		return "movie/boxoffice";	
	}
	
	@GetMapping(path = {"/movieDetail"})
	public String movieDetail(Model model, int no) {
		Movie movieDetail = movieService.getMovieByNo(no);
		model.addAttribute("movieDetail", movieDetail);
		return "movie/movieDetail";	
	}
}
